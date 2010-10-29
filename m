From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] Revert
 "kconfig: Temporarily disable dependency warnings"
Date: Fri, 29 Oct 2010 11:37:31 +1100
Message-ID: <20101029113731.5c7c54b9.sfr@canb.auug.org.au>
References: <20101011145930.11fe570c.randy.dunlap@oracle.com>
	<1286889586-13483-1-git-send-email-mmarek@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__29_Oct_2010_11_37_31_+1100_vFZDSyxDyrwv6m=A"
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1286889586-13483-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: randy.dunlap@oracle.com, catalin.marinas@arm.com, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, lacombar@gmail.com, xiyou.wangcong@gmail.com
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__29_Oct_2010_11_37_31_+1100_vFZDSyxDyrwv6m=A
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Oct 2010 15:19:46 +0200 Michal Marek <mmarek@suse.cz> wrote:
>
> This reverts commit 71ebc01, which was a 2.6.36-only stopgap solution.

I was hoping that we would have the number of these warnings down to
something reasonable before this revert made it into Linus' tree ...

I guess fixing the V4L stuff will become a bit more urgent, now :-)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__29_Oct_2010_11_37_31_+1100_vFZDSyxDyrwv6m=A
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMyhdLAAoJEDMEi1NhKgbsW4wH/3DSwcOtVPtACdCfGxtv0jZe
C5X/DStxzyEy1yPf2zmUqut5FwpduZK/hucFnffG3AYfrbaP98jsl6GBdlRZNeAF
7ypsa3xkROCePdQI1Ig8cnvj/pc1nmqcldFrmdRqhYkOPXvHF/7AnBL4agpreB0K
C+eu+ChsE25WaXSLtOqigECcFrP6YZdOdi4hkzHrv1F9ULrCdRZPCR4HZMXh+U8G
DWlHoEr9ko084LXJJU8G2ZweOh6IAJ9oxgmfkR+D9C6uN4n0BnewGA5gAzpgxr+U
OhBE/EI4Iir45jwkgsbD0yJDJTQnLHIax7DBLJDpvsCs4mAW95CU9xm23/C8r/w=
=FY/p
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Oct_2010_11_37_31_+1100_vFZDSyxDyrwv6m=A--
