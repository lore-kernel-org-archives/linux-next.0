From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the userns tree
Date: Wed, 6 Feb 2019 10:04:54 +1100
Message-ID: <20190206100454.7a5066cb@canb.auug.org.au>
References: <20190206073330.6e266351@canb.auug.org.au>
        <87bm3pzzz3.fsf@xmission.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1+Y.4ihF5A7Y45/5=5iUjWn"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87bm3pzzz3.fsf@xmission.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/1+Y.4ihF5A7Y45/5=5iUjWn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Tue, 05 Feb 2019 15:29:04 -0600 ebiederm@xmission.com (Eric W. Biederman=
) wrote:
>
> The SHA1 tag does exist and I have another tag:
> History Tree: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/histor=
y.git
> That lists the tree it actually came from.

Ah, tricky.

> That is the best way I can see to handle bugs that predate v2.6.12 that
> Linus first put into git.
>=20
> Would it make sense to graft you tree that you check for the existence
> of bad sha1s to Thomas's import of the bk tree into git?

I can just get a copy of that tree and check for things in there as
well, I guess.  Though it shouldn't come up much (I hope :-))

> Is there a better way to refer to old commits that I haven't seen?

Not that I am aware of and I guess it is as good as any.

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/1+Y.4ihF5A7Y45/5=5iUjWn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxaFpYACgkQAVBC80lX
0GxQoQf/SD8jtgTJjFKsDffjTu10J02sMEHM8//HI56mfHbcVUZhYP51yOTgrORB
5+EWIlmqbjWhns0nbxCogkS1twXBehH2MdzvTAiouXtQDF/47y8yo5semLDGqQGe
wjbzctsz/4/AbXXgzBaGyBw0XUq++PsJ4qW0XxJY/7NEtiYuA+OrfQ9lY7Sl+tVF
9JGHPrx7qx37yrbncER/m1TjbjE5CIuc+To/Pm1EVgismLkt7tm06DlrX7y95ljz
PW4lUPWC94BVF2Lq1AogQWkXismenFsx/pFYcHJSF10IJUTvo6ta6YLz0BYJjGco
HTDigYpd/4TuY9wQ1rl2BzbyG1GWIg==
=M7aA
-----END PGP SIGNATURE-----

--Sig_/1+Y.4ihF5A7Y45/5=5iUjWn--
