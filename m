From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 3 Sep 2010 12:12:01 +1000
Message-ID: <20100903121201.336c4ba8.sfr@canb.auug.org.au>
References: <20100903121023.54c40e73.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__3_Sep_2010_12_12_01_+1000_Pjr8IgXD4pW14xXG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54159 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753253Ab0ICCMI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Sep 2010 22:12:08 -0400
In-Reply-To: <20100903121023.54c40e73.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Haicheng Li <haicheng.li@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, Wu Fengguang <fengguang.wu@intel.com>

--Signature=_Fri__3_Sep_2010_12_12_01_+1000_Pjr8IgXD4pW14xXG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Sep 2010 12:10:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>=20
> arch/x86/mm/init_64.c: In function 'kernel_physical_mapping_init':
> arch/x86/mm/init_64.c:601: warning: 'addr' may be used uninitialized in t=
his function
>=20
> The code does look suspicious ... 'addr' gets declared and then passed to
> a function, but is not set anywhere ...

Forgot to say:

Introduced by commit 9b861528a8012e7bc4d1f7bae07395b225331477 ("x86-64,
mem: Update all PGDs for direct mapping and vmemmap mapping changes").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__3_Sep_2010_12_12_01_+1000_Pjr8IgXD4pW14xXG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMgFlxAAoJEDMEi1NhKgbsc5oH+gNh97v/4KqOQBLfZ92QYB3f
/QYQePGb/AmbSRym9SSzPArTTVFFV30FMMMLRC5OQ1YDRWqXQpk3WrRgAV/pcdQQ
HNLyz2ElG/35bSUxd/qeeQdeXe5mfwR4i9yTFCgKPfQnxYFGEtnv9k8GWNwjwFRx
cEI0FbyQOpXeqVG6dMlXb3Y7DJXavS23byiKE68PtxdfLPIRU9/h1LEAq60pYB0L
hsDpUDIT/fTCFvYOjoxcd02/hfsu9X1izb+t+4GJvy6MocM7h8NkysrRVeu+MGXd
6ro3YJUKdFdMFym5JejkjeGXtBMzLbHeXepS8eQMG/muL5mkxUzJ/32zLvrsl7c=
=ItVM
-----END PGP SIGNATURE-----

--Signature=_Fri__3_Sep_2010_12_12_01_+1000_Pjr8IgXD4pW14xXG--
