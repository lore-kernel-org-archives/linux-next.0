From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Thu, 27 Sep 2012 17:46:11 +1000
Message-ID: <20120927174611.670fc53dfb36b4205308bf68@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__27_Sep_2012_17_46_11_+1000_Z8x24pytOdLc16in"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:44933 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755864Ab2I0HqN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 Sep 2012 03:46:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__27_Sep_2012_17_46_11_+1000_Z8x24pytOdLc16in
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc allnoconfig)
produced this warning:

mm/memory.c: In function 'do_prot_none':
mm/memory.c:3463:6: warning: unused variable 'node' [-Wunused-variable]

Introduced by commit 39d6cb39a817 ("mm/mpol: Use special PROT_NONE to
migrate pages").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__27_Sep_2012_17_46_11_+1000_Z8x24pytOdLc16in
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQZARDAAoJEECxmPOUX5FEkP8P/RywSSPqSlOa6pSoBEldTjsm
enqnGlcn/4RkKUObiujgdhmRxLg0HqJJGvxw0VHPSLXVNNxGOM1LfTi1DajJtpVF
2rYrcv5RsI5fI/7sDGzhWAoFqaYlfcRm/HRKJ5eWPGrKnCSWcldePUPZIppyVHDw
X5sVaEAohb34wjDt1vgoTFTRFzr6jDudmpJ6D4t3r/pHmm9XsDF9nVP6uXBPjPys
fBidpJ+mHdA49RFPclwBuupKgIqv6G7mmcmS3IrfSIxRO9dBdEbra6Kapay+VO1g
Rx6TJkiH27g177plB/tL21BDbpBjiDyefcPTIjEEhZSGK2ApFoIuDSuNEs/L7U50
ZSal+YddI6oDUHeGdsiSk6I/cvnP0GFki6YB8voq4MClMpLoWSvK7dq0q7aOYHDq
RcgefjiLnUU89OSCe0b+AZO30ppJqXg/uvR7O1oEGJtuxcYv++EEfRhtTs/3trBb
dnasQPriRwgfkr+8IH1KxLo+RIYksHizefy6pRljlT/GQshikaVJfSe/Q+maAw2d
Q8TmCecKsedQcJL2ODeYseS7cz+zOr0qLtNssifHyCY+gabKpzp7GyXGN1cQxgK/
tGdqxmDvTO2zg7BoESmzsPGeygVSCW1hU5rzgQ/yINwoNgCKROtqjh7pQ3frUucl
2qnv3QlINLhp5jEGWeMk
=w2VC
-----END PGP SIGNATURE-----

--Signature=_Thu__27_Sep_2012_17_46_11_+1000_Z8x24pytOdLc16in--
