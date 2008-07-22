From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the sched tree
Date: Tue, 22 Jul 2008 18:28:34 +1000
Message-ID: <20080722182834.73d5e293.sfr@canb.auug.org.au>
References: <20080722115457.46aa2c98.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__22_Jul_2008_18_28_34_+1000_G/a0mvzBEoq_IHEt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37863 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752065AbYGVI2p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Jul 2008 04:28:45 -0400
In-Reply-To: <20080722115457.46aa2c98.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Roland McGrath <roland@redhat.com>

--Signature=_Tue__22_Jul_2008_18_28_34_+1000_G/a0mvzBEoq_IHEt
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 22 Jul 2008 11:54:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the sched tree got a conflict in
> include/asm-x86/thread_info.h between commit
> 64f097331928b01d704047c1dbc738bb6d2a9bf9 ("x86 ptrace: unify
> TIF_SINGLESTEP") from the  tree and commit
                        ^^^^
Linus'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__22_Jul_2008_18_28_34_+1000_G/a0mvzBEoq_IHEt
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiFmjIACgkQjjKRsyhoI8xElgCghzSnSXb/pqP+riVSp7H9fd6g
SwAAoKSW8cL0RbM55X5e7jCgYCx1E0hU
=Er51
-----END PGP SIGNATURE-----

--Signature=_Tue__22_Jul_2008_18_28_34_+1000_G/a0mvzBEoq_IHEt--
