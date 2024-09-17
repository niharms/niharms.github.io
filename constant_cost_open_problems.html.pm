#lang pollen

◊logo{}


◊separator-large

◊card-header{Headaches in Constant-Cost Communication}

◊center{◊tt{(and a few organic remedies)}}
◊separator-mid

◊panel-main{
◊content-card-basic{

A brief and incomplete guide to the open problems and results in constant-cost communication.  I
will try to keep it up to date. If you cure a headache or cause a new headache, please tell me...  OR
ELSE.

Last updated: 2024-07-16.
}

◊content-card-basic{
◊center{◊Large{◊sc{Definitions (Informal)}}}

A ◊it{communication problem} is a family of Boolean-valued matrices.

An ◊it{oracle protocol} is...

A problem ◊it{reduces} to another problem when...
}


◊content-card-basic{
◊center{◊Large{◊sc{Headaches}}}

◊bf{New communication problems.} It is always nice to find new constant-cost problems, especially
ones that look different from the ones we know. "Looking different" is informal, but if you can
prove that it does not reduce to any known problem then that is certainly interesting.

◊it{Nathan thinks:} There should be many more constant-cost problems. The universe is deep and
mysterious.

◊dinkus

◊bf{Large monochromatic rectangles.} Let P be any constant-cost problem. Does every N by N matrix in
P have an ... math math ... submatrix? 

This is a conjecture of Lianna Hambardzumyan, Hamed Hatami, & Pooya Hatami [HHH22], and a special
case of a question of Arkadev Chattopadhyay, Shachar Lovett, and Marc Vinyals [CLV19], and it is
pretty important -- communication complexity is all about monochromatic rectangles! We simply cannot
abide diversity in our rectangles, no sir.

◊it{Nathan thinks:} The answer should be YES! But some people say that some people say that there
are rumors that the answer could be imagined to be no. Unconfirmed.

◊dinkus

◊bf{Completions of Gap Hamming Distance.} Can the Gap Hamming Distance matrix be completed to form
a constant-cost communication problem?

The (constant-)Gap Hamming Distance (GHD) matrix with gap gamma has rows and columns indexed by n-bit binary
strings, such that entry x,y is 1 when the Hamming distance is at most gamma n, 0 when then Hamming
distance is at least (1-gamma) n, and * otherwise. GHD has a constant-cost protocol, but it is a
◊it{partial} matrix. Also, every constant-cost communication matrix is a submatrix of Gap Hamming
Distance for some constant gamma -- this follows from a result of Nati Linial & Adi Shraibman [LS09]
as well as an elementary argument that we put in the appendix of [FGHH24]. 

We know that it is impossible to complete the GHD matrix in a way that it has large monochromatic
rectangles (I think there are at least 5 different proofs of this, see e.g.??,??,??,??,??). So,
under the monochromatic rectangle conjecture, it should not be possible to complete GHD to be a
constant-cost problem.

It is not terribly difficult to show that the sign-rank of 1-Hamming Distance is bigger than 4.
So, only infinitely many numbers remain...

◊it{Nathan thinks:} The answer should be NO!

◊dinkus

◊bf{Sign-rank of 1-Hamming Distance.} Does the ◊sc{1-Hamming Distance} problem have bounded
sign-rank?

This question was explicitly stated by Hamed Hatami, Pooya Hatami, William Pires, Tao, & Zhao
[HHPTZ22]. They showed that the known lower-bound techniques against sign-rank fail to answer this
question. If 1HD has unbounded sign-rank, it would separate the classes BPP0 and UPP0.

◊it{Nathan thinks:} The answer should be NO!

◊dinkus

◊bf{Intersection of BPP0 and UPP0.} Is the class of problems with ◊it{both} constant-cost
communication and bounded sign-rank equal to the class of problems that have a constant-cost
◊sc{Equality}-oracle protocol?

This was asked by Viktor Zamaraev and I in [HZ24], and it would resolve some of the other questions:
it would show that ◊sc{1-Hamming Distance} does not have bounded sign-rank (because ◊sc{1-Hamming
Distance} does not reduce to ◊sc{Equality} [HWZ22,HHH22]), and ...

◊it{Nathan thinks:} The answer should be YES! Is he brave enough to make it a conjecture? NO!

◊dinkus

◊bf{Equality-oracle complexity of BPP0.} Is there an Equality-oracle protocol with cost
polyloglog(N) for any constant-cost problem?

If so, this would show that the ◊sc{Integer Inner Product} problems do not have constant cost,
since they are known to require log(N) ◊sc{Equality}-oracle queries (a result of
Tsun-Ming Cheung, ??, and Morgan Shirley [CHHS23]).

This question does not appear explicitly in the official literature but I have worked on it and I
heard some others are working on it, you can ask me who.

◊it{Nathan thinks:} That would be nice but who knows! 

◊dinkus

◊bf{Quantitative separations for k-Hamming Distance.} Is there a lower bound of log(n) k-Hamming
Distance queries required to compute (k+1)-Hamming Distance on n bits, for all constants k?

Yuting Fang, Lianna Hambardzumyan, Pooya Hatami, and I [FHHH24] showed a ◊it{non-constant} lower
bound for infinitely many values of k. Can this be improved to ◊it{all} values of k, and can it be
improved quantitatively to match the log n upper bound from binary search?

◊it{Nathan thinks:} This lower bound should hold. Shame on us for not proving it already.

◊dinkus

◊bf{Better boosting for constant-cost oracles.} Using standard probability boosting, for any
constant-cost problem P, a P-oracle protocol using q queries to P can be transformed into a
randomized protocol with cost O(q log q). For which oracles P can this be improved?

Artur Riazanov and I showed in [HR24] that one can get O(q) for the ◊sc{Equality} oracle,
but ◊it{not} for the ◊sc{1-Hamming Distance} oracle. We conjecture that "better boosting" is
possible only for problems P that reduce to ◊sc{Equality}.

◊it{Nathan thinks:} That was my conjecture, right? So you know what I think.

◊dinkus

◊bf{Better boosting for bounded sign-rank.} Does every constant-cost problem with bounded sign-rank
have "better boosting"?

The conjecture of [HZ24] (which says that every constant-cost problem with bounded sign-rank reduces
to ◊sc{Equality}) would imply that the answer to this question is yes -- so this is a weaker
question than that.

◊it{Nathan thinks:} I hoped this would be an approach towards separaing BPP0 and UPP0 (since
◊sc{1-Hamming Distance} does not have better boosting), but it is not clear if it is any easier.

◊dinkus

◊bf{Problems between Equality and 1-Hamming Distance.} Let P be a constant-cost problem.
Is it always the case that either (1) P reduces to Equality, or (2) 1-Hamming Distance
reduces to P? (In other words, is there nothing "between" Equality and 1-HD?)

If there is nothing between ◊sc{Equality} and ◊sc{1-Hamming Distance}, then our result in [HR24]
answers the "better boosting" question.

◊it{Nathan thinks:} ??

◊dinkus

◊bf{Sufficient conditions for finitely-defined problems.} Say that a communication problem P is
◊it{finitely-defined} if there is a finite set H of matrices such that P is the family of all
matrices which do not contain any submatrix in H. If P is finitely defined, then are the conditions

1. The number of N by N matrices in P is at most 2^O(N log N); and

2. P is ◊it{stable}

sufficient to guarantee that P has constant-cost?

Lianna Hambardzumyan, Hamed Hatami, & Pooya Hatami [HHH22b] showed that these conditions are not
sufficient in general, but for finitely-defined problems they may be. Viktor Zamaraev and I made
some progress towards this in [HZ24].

◊it{Nathan thinks:} Too early to tell.

}

◊content-card-basic{
◊center{◊Large{◊sc{Organic Remedies}}}

[HHH22] Lianna Hambardzumyan, Hamed Hatami, Pooya Hatami. ◊it{Dimension-free Bounds and Structural
Results in Communication Complexity}, Israel Journal of Mathematics 2022.

[HWZ22] Nathaniel Harms, Sebastian Wild, Viktor Zamaraev. ◊it{Randomized Communication and Implicit
Representations of Graphs}, STOC 2022.

[HR24] Nathaniel Harms, Artur Riazanov. ◊it{Better Boosting for Communication Oracles, or Not},
manuscript 2024.
}
}

