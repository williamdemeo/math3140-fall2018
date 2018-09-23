︠90d53e54-0251-45b9-a7a2-0542d2ad4d26i︠
%md 
# Group of symmetries of a rectangle

**The universe of this group**

The "universe," or set of elements of this group, is $\{e, \mu_1, \mu_2, \rho\}$, and these elements act on the set $\{1, 2, 3, 4\}$ by permuting the elements of this set in certain ways. To describe this action, imagine a rectangle with vertices labelled counter-clockwise: 1 in the south-west corner, 2 in the south-east corner, 3 in the north-east corner, and 4 in the north-west corner. The result looks something like this:
$$\begin{bmatrix} 4 & 3 \\
&\\
 1 & 2 \end{bmatrix}$$

1. The identity element (leaves all four corners of the square fixed)
$e = \begin{pmatrix} 1 & 2 & 3 & 4\\ 1 & 2 & 3 & 4 \end{pmatrix}$

2. Reflection across a vertical line
$\mu_1 = \begin{pmatrix}1 & 2 & 3 &4\\2 & 1 & 4 &3\end{pmatrix}$

3. Rotation by 180 degrees
$\rho = \begin{pmatrix}1 & 2 & 3 &4\\3 & 4 & 1 &2\end{pmatrix}$

4. Reflection across a horizontal line
$\mu_2 = \begin{pmatrix}1 & 2 & 3 &4\\4 & 3 & 2 &1\end{pmatrix}$


︡8cb663b5-3f15-46f9-b019-93e506134eb9︡{"md":"# Group of symmetries of a rectangle\n\n**The universe of this group**\n\nThe \"universe,\" or set of elements of this group, is $\\{e, \\mu_1, \\mu_2, \\rho\\}$, and these elements act on the set $\\{1, 2, 3, 4\\}$ by permuting the elements of this set in certain ways. To describe this action, imagine a rectangle with vertices labelled counter-clockwise: 1 in the south-west corner, 2 in the south-east corner, 3 in the north-east corner, and 4 in the north-west corner. The result looks something like this:\n$$\\begin{bmatrix} 4 & 3 \\\\\n&\\\\\n 1 & 2 \\end{bmatrix}$$\n\n1. The identity element (leaves all four corners of the square fixed)\n$e = \\begin{pmatrix} 1 & 2 & 3 & 4\\\\ 1 & 2 & 3 & 4 \\end{pmatrix}$\n\n2. Reflection across a vertical line\n$\\mu_1 = \\begin{pmatrix}1 & 2 & 3 &4\\\\2 & 1 & 4 &3\\end{pmatrix}$\n\n3. Rotation by 180 degrees\n$\\rho = \\begin{pmatrix}1 & 2 & 3 &4\\\\3 & 4 & 1 &2\\end{pmatrix}$\n\n4. Reflection across a horizontal line\n$\\mu_2 = \\begin{pmatrix}1 & 2 & 3 &4\\\\4 & 3 & 2 &1\\end{pmatrix}$\n\n\n"}︡
︠f9e16dd9-cd4d-4fed-8806-4594339d4672is︠
%md 
##Generating the symmetries of a rectangle in Sage

There are many ways to generate this group in Sage.  Since I'm most familiar with the Gap software, I'll start by using Sage's interface to Gap.  (Below we'll construct the group in a more direct way.)

︡02f0d485-c9dd-46c5-b623-c253c6e0e945︡{"md":"##Generating the symmetries of a rectangle in Sage\n\nThere are many ways to generate this group in Sage.  Since I'm most familiar with the Gap software, I'll start by using Sage's interface to Gap.  (Below we'll construct the group in a more direct way.)\n\n"}︡
︠b090221a-2899-4401-b185-f8ee7c43eed3︠
%gap
G:=Group((1,2)*(3,4), (1,4)*(2,3));;
Elements(G);
︡d5673c8b-f434-4b6c-9a37-fa8afdc621f9︡{"stdout":"[ (), (1,2)(3,4), (1,3)(2,4), (1,4)(2,3) ]"}︡
︠b2202b06-ce47-41a9-847f-5d3820192ac1i︠
%md Here's a way to construct this group directly in Sage.
︡0839bfd6-079b-4035-8d6b-7923785bd108︡{"md":"Here's a way to construct this group directly in Sage."}︡
︠6e969453-0e8e-4c35-8900-c6890167d540︠
S4 = SymmetricGroup(4)
mu1 = S4("(1,2)(3,4)")
mu2 = S4("(1,4)(2,3)")
G = S4.subgroup([mu1, mu2])
G.list()
︡3f73bf27-1e2d-401f-85eb-e49b79b35607︡{"stdout":"[(), (1,2)(3,4), (1,3)(2,4), (1,4)(2,3)]\n"}︡
︠a7ef6cc0-b14e-4b94-bc50-5e9077052f79i︠
%md We can get Sage to print out the group's Cayley table:

︡dd54bd6a-bada-43a1-8879-eec7ddeabb08︡{"md":"We can get Sage to print out the group's Cayley table:"}︡
︠4d0d3cec-c3e8-46a6-b565-cb13e1449d3bo︠
G.cayley_table()
︡17e9c6e3-d6cc-45a3-b198-002918ef7f3a︡{"stdout":"*  a b c d\n +--------\na| a b c d\nb| b a d c\nc| c d a b\nd| d c b a\n\n"}︡
︠f0b68d8a-dafb-408d-b9d9-fef70f2eda1fi︠
%md However, this is not very informative because Sage has chosen letters a through h as the names of the group elements, and it's hard to tell which element each letter represents.  So, let's tell Sage to use the permutations as the names:
︡c4bbce27-ff5d-447a-82c3-ad7e0249d846︡{"md":"However, this is not very informative because Sage has chosen letters a through h as the names of the group elements, and it's hard to tell which element each letter represents.  So, let's tell Sage to use the permutations as the names:"}︡

︠6691672a-91db-4ab0-be41-f1daf2261f60o︠
G.cayley_table(names='elements')
︡28d513ab-2179-42a9-9ad1-e9b083ffc5a9︡{"stdout":"         *          () (1,2)(3,4) (1,3)(2,4) (1,4)(2,3)\n          +--------------------------------------------\n        ()|         () (1,2)(3,4) (1,3)(2,4) (1,4)(2,3)\n(1,2)(3,4)| (1,2)(3,4)         () (1,4)(2,3) (1,3)(2,4)\n(1,3)(2,4)| (1,3)(2,4) (1,4)(2,3)         () (1,2)(3,4)\n(1,4)(2,3)| (1,4)(2,3) (1,3)(2,4) (1,2)(3,4)         ()\n\n"}︡
︠3d568349-69d1-4949-a8a5-99c06b11323ais︠
%md Even more informative might be to provide own names:
︡223e4dbe-27f5-46d9-a6af-eb4c0e50e5fc︡{"md":"Even more informative might be to provide own names:"}︡
︠1ee5fedf-41aa-4be3-963c-30dd20860d70o︠
G.cayley_table(names=['e', 'mu1', 'rho', 'mu2'])
︡60e0f6cf-d462-45e6-ad28-b9ce3b401d42︡{"stdout":"  *    e mu1 rho mu2\n   +----------------\n  e|   e mu1 rho mu2\nmu1| mu1   e mu2 rho\nrho| rho mu2   e mu1\nmu2| mu2 rho mu1   e\n\n"}︡
︠bc4882ba-c241-4d16-b0c8-fb794a0187bdi︠
%md 
##The group $\mathbb{Z}_8$

Another 8-element group we have seen is the abelian group $\mathbb{Z}_8$ of (congruence classes of) integers modulo 8.










