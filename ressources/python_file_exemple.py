# -*- coding: utf-8 -*-
"""
Created on Tue Feb  4 08:31:41 2020

@author: 10055690
"""


from random import randint
from math import ceil
from time import sleep
import sys

#example base AMNS
#Le modulo p est : #383 digit
p=19001325514169087268406693340194127777457227427109835115440089655205287947805423172915761409766796895644242980498091
n=7
#☺Gamma vaut 
gm=8195650973931066992763945313281353139240358463116127703132522462647413881247989420665766679937696867603929003724600
#précalcul des gi
g=[]
for i in range(n):
    g.append((gm**i)%p)
#log2(rho) vaut 40
r=59
#lambda vaut
l=2
#Phi vaut : 2^48
phi=64
#Delta vaut 1
delta=0
#∟M vaut 
m= [14807002114946271,  10948980830932565,  5594196924646384,  12164222651171945,  6485554781872877,  -15240715899375580,  -4269652297641805]
#M' vaut
rp= [-533684755635581,  28228989870826782,  31933239417231296,  23174402041774392,  8952977530335050,  4409576548903540,  -3139499679838525]
#La representation de Rho*Phi dans la base : 
mp= [4061600423064578463,  1002183804661793117,  4469914478408161405,  13451109246071015664,  7565988620960822268,  5536628105856800310,  13834881095578633368]



#calcul des Pi[X]
P=[0]*n
for i in range(n):
    P[i]=[0]*n
for i in range(n):
    P[i][0]=(1<<(i*r))%gm
    for j in range(1,n):      
        P[i][j]=(1<<(i*r))//(gm**j)
        
        

class AMNS_base(object):
    def __init__(self, p,n,gm,r,l,phi,delta,m,mp):
        self.Modulus = p
        self.Degree = n
        self.Gamma = gm
        self.Rho = r
        self.Lambda = l
        self.Phi=phi
        self.Delta=delta
        self.M=m
        self.Mprime=mp
        


        
        
#A=[12741426249, 1923696700, 14100876336, 5332402849, 16884680756, -6564052224, -16215085334, -16664611053, -3378447364, 4457744481, 1910419222]
#B=[150315930390823, 177201349891848, 57796978436580, 48138803720413, 53226075583372, 197917233661888, 226864278077389, 61673940272415, 270970822283160, 147191973389118, 6968914856324]
      
        


##################################################
def add_Poly(A,B,n):#ok
    S=[0]*n
    for i in range(len(A)):
        S[i]=A[i]+B[i]
    return S
   

def red_Mod_phi(A,phi):#ok
    S=[0]*len(A)
    for i in range(len(A)):
        S[i]=A[i]%(2**phi)
    return S
        

   
def mul_Poly(A,B,n,l):#ok
    temp=[0]*n**2
    Q=[0]*n
    for i in range(n):
        for j in range(n):
            temp[i*n+j]=(A[i]*B[j])#comput partial product 
            if (i+j)<n:
               Q[i+j]=Q[i+j]+temp[i*n+j]
            else :
                Q[(i+j)-n]=Q[(i+j)%n]+l*temp[i*n+j]#mul par lambda simplifiable selon lambda
    return Q


def div_phi(A,phi):#ok
    S=[0]*len(A)
    for i in range(len(A)):
        S[i]=A[i]>>(phi)
    return S
        

def RedCoeff(V,p,n,gm,r,l,phi,delta,m,mp):#ok
    #Q=V*M'mod(E,phi)
    V2=red_Mod_phi(V,phi)#on as pas besoin des bits de poids fort de V comme on fait la réduction par phi après.
    Q=mul_Poly(V2,mp,n,l)
    Q2=red_Mod_phi(Q,phi)
    #S=V+Q*M
    QM=mul_Poly(Q2,m,n,l)
    R=add_Poly(V,QM,n)
    S=div_phi(R,phi)
    
    return S
        

def to_AMNS(a,p,n,gm,r,l,phi,delta,m,mp):#ok
    A=[0]*n
    A[0]=(a<<(phi*n))%p
    for i in range(n-1):
        A=RedCoeff(A,p,n,gm,r,l,phi,delta,m,mp)#ok
    return A

def to_Binary(A,p,n,gm,r,l,phi,delta,m,mp):#ok
    B=RedCoeff(A,p,n,gm,r,l,phi,delta,m,mp) #si on vient d'en faire un il ne faut pas en faire un la
    a=0
    for i in range(n):
        a=(a*gm+B[n-1-i])%p
    return a

def AMNS_Mul(A,B,p,n,gm,r,l,phi,delta,m,mp):#ok
    V=mul_Poly(A,B,n,l)
    V0=red_Mod_phi(V,phi)
    Q=mul_Poly(V0,mp,n,l)
    Q2=red_Mod_phi(Q,phi)
    #S=V+Q*M
    QM=mul_Poly(Q2,m,n,l)
    R=add_Poly(V,QM,n)
    S=div_phi(R,phi)
    return S



allPositiveCoef = False

foundAfter = 0

while(allPositiveCoef == False):
    foundAfter +=1
    a=(randint(0, p-1))
    b=(randint(0, p-1))
    c=a*b%p
    
    allPositiveCoef = True
    A=to_AMNS(a,p,n,gm,r,l,phi,delta,m,mp)
    B=to_AMNS(b,p,n,gm,r,l,phi,delta,m,mp)

    for a in A:
        if(a<0):
            allPositiveCoef = False;
    for b in B:
        if(b<0):
            allPositiveCoef = False;



C=AMNS_Mul(A,B,p,n,gm,r,l,phi,delta,m,mp)
c1=to_Binary(C,p,n,gm,r,l,phi,delta,m,mp)


print("Final Seed a:{}\nb:{}//\nc:{}\n found after {} iterations".format(a,b,c,foundAfter))
print("Poynomial multiplication inside AMNS")
print ("Converted seed A: {} \nB: {}".format(A,B))
print("Vérif mul : "+str((c-c1)%p==0))


