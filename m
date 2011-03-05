From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Duplicate patches in the tree
Date: Sun, 6 Mar 2011 08:36:44 +1100
Message-ID: <20110306083644.f2bec4af.sfr@canb.auug.org.au>
References: <alpine.LNX.2.00.1103052113270.32044@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__6_Mar_2011_08_36_44_+1100_mgTRhUjmqBaDID81"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57417 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751667Ab1CEVgw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 5 Mar 2011 16:36:52 -0500
In-Reply-To: <alpine.LNX.2.00.1103052113270.32044@swampdragon.chaosbits.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Juhl <jj@chaosbits.net>
Cc: linux-next@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

--Signature=_Sun__6_Mar_2011_08_36_44_+1100_mgTRhUjmqBaDID81
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesper,

On Sat, 5 Mar 2011 21:45:19 +0100 (CET) Jesper Juhl <jj@chaosbits.net> wrot=
e:
>
> I noticed something currious today in linux-next.=20
> There are, what looks to me like, duplicate patches with different commit=
=20
> id's but identical contents. Perhaps this is just a git artefact that I=20
> don't know about, but it seemed currious enough that I thought I'd ask.

This happens sometimes ...

> The two patches are these (from 'git log'):
>=20
> commit a9c3809db31be860db4e8ecf8ab359159c935a3b
> Author: Jesper Juhl <jj@chaosbits.net>
> Date:   Wed Feb 23 23:45:55 2011 +0100

This one is in the voltage tree.

> commit 4b2f67d756cf4a5ed8e8d11caa7dcea06c41a09e
> Author: Jesper Juhl <jj@chaosbits.net>
> Date:   Wed Feb 23 23:45:55 2011 +0100

This one is in Linus' tree.

> If I do a 'git log drivers/regulator/mc13xxx-regulator-core.c' I only see=
=20
> commit 4b2f67d756cf4a5ed8e8d11caa7dcea06c41a09e .

git filters out "uninteresting" commits including duplicates like this.

> Please enlighten me if this is perfectly normal and not a problem.=20
> Currently I'm a bit puzzled by two commit id's showing up for the same=20
> change..

Its perfectly normal, it just means that the branch of the voltage
tree has included in linux-next is not based on (or merged with) the branch
that is has been submitted to Linus.  This happens a bit with bug fixes.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__6_Mar_2011_08_36_44_+1100_mgTRhUjmqBaDID81
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJNcqzsAAoJEDMEi1NhKgbsIRAH/j2ggFuWPTY6euhvhhFSVa8h
6ooN13xXK35cd6vOjP+t7kaYVKJhnsXwF70CjD4zk2Jv/tqnB991cITzNL8ZLprF
9KTV+oGF7jUWHaZm5hR2adEpqSaBZ/2AUaqlXjGKZoLNsgHxchF0/1CYQXSyiVV5
e60aVxmWShl7rel82Zz2QTpNjNOulf6pWa605dteBI0YDlK6OJIVcU+qWIhwjeUv
3ObkF24UCwGIuqH6ckzJmaZ72h+3ZbXb8uUtj5gj7afisqgIT3csEMdn118wbUun
w9DouP2aLVyTDDkDKsQjfQ35XZF+OYj25y7AsGdKHhEMrDMBiWQLw/lxhBfeKco=
=PUp+
-----END PGP SIGNATURE-----

--Signature=_Sun__6_Mar_2011_08_36_44_+1100_mgTRhUjmqBaDID81--
