From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: sparc32 build...
Date: Fri, 16 Mar 2012 14:12:22 +1100
Message-ID: <20120316141222.210a0ccf1a245367e5c956f5@canb.auug.org.au>
References: <20120315.195934.2192536141028515540.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__16_Mar_2012_14_12_22_+1100_JCuQV=c=allH5qgW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:42883 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030260Ab2CPDMd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 23:12:33 -0400
In-Reply-To: <20120315.195934.2192536141028515540.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, tony@bakeyournoodle.com

--Signature=_Fri__16_Mar_2012_14_12_22_+1100_JCuQV=c=allH5qgW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 15 Mar 2012 19:59:34 -0700 (PDT) David Miller <davem@davemloft.net>=
 wrote:
>
> Stephen, just checking, did my Makefile change make the sparc32 build
> failures go away with newer tools?

Yeah, seems to have worked.  See (sparc defconfig builds)
http://kisskb.ellerman.id.au/kisskb/buildresult/5869567/ (next-20120313 -
bad) v. http://kisskb.ellerman.id.au/kisskb/buildresult/5871624/
(next-20120314 - good)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__16_Mar_2012_14_12_22_+1100_JCuQV=c=allH5qgW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPYq+WAAoJEECxmPOUX5FEKKUQAJHvFE2YPsoTT1gXMhOi3cHQ
vH1hfexubPfYSXNxhalwdrMzbGzWSYhbImuan2tr3N3QbRzMzVxlYoUep2wse/b/
ntNUfMo06RpnGFblj8BPrR6HDKjMwQ984SRsj4ZmmZc6lcBSWIpxuQrqHbRPuDgI
RnXlzYvtQv0zkP87CJxBMkxNS3mDcFdyAsYa7ehhPjCvMK9VZGzogArqLpdgLpni
8uRUF0m2DfFUOEATleGOiEnwOVRrg+OmPjGkFPHGd1FmtmuZuRMCvNzY8ZtxNlXn
RitPMhVM2naaZXCbfnoKc00sjpFk4LS1Npq1hAATbYweHJNTwCjchwSK/1a9sInl
uJu25fYo0NzZPCtldJXvvH3IwbDLghmWJC7NJ+QszAV5zJeZxi7s3Xb3JGJu2Xei
AKwtQt3TKZBBxD7R/3udIgB2Orl7z1QKFpOXxsAPrt1M2s/59DFvjDCPLaR7KJ9x
rZ7hyt2aejXMIqL+belJTTM6BX1Fvk9z0BmTSS4Do/b0Qq1Qmbs/KkPpBJgcctb3
B+tMC2M2LjAbS/OoW51kstkvF11e/IU/DpaUUL/i96Ow7+5ptvAjdwGT5VTSYAO/
yoaaEvII7fi6UifNKd43G/5BSdb5Sm9kikNNHzDnu+IMnTw8WQwe16BlL8tzR+0g
Jbjcu8AgMfQ2E0/vk4s6
=TDb6
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Mar_2012_14_12_22_+1100_JCuQV=c=allH5qgW--
