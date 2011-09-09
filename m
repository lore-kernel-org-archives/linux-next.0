From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the l2-mtd tree with the at91 tree
Date: Fri, 9 Sep 2011 20:27:44 +1000
Message-ID: <20110909202744.48dea6e29c1902afe367cc64@canb.auug.org.au>
References: <20110909132920.3696fbb6c1b90cded9727d30@canb.auug.org.au>
	<1315550734.7905.14.camel@sauron>
	<20110909164539.bae897109d3de0e67f0db69a@canb.auug.org.au>
	<4E69E21F.5070701@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__9_Sep_2011_20_27_44_+1000_+znZOHhrYtT.kgDg"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E69E21F.5070701@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: dedekind1@gmail.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Nico Erfurth <ne@erfurth.eu>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__9_Sep_2011_20_27_44_+1000_+znZOHhrYtT.kgDg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Fri, 09 Sep 2011 11:53:35 +0200 Nicolas Ferre <nicolas.ferre@atmel.com> =
wrote:
>
> So, as I am not so used to this kind of situation, I wonder if I need
> to included those two patches from Russell's and Artem's git trees in
> our at91-next one or if I only carry on with current patch series
> until Linus merges all this himself?

Just carry on, the conflicts will be fixed up When Linus merges your tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__9_Sep_2011_20_27_44_+1000_+znZOHhrYtT.kgDg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOaeogAAoJEDMEi1NhKgbsVagIAJlbxJqUQnjUgvGM6CkYYzrc
SqTNblGZWdwmFmwgmDc5dVGadxcMb6uLBOU7OWgEbymGEMUoMWZ5nYgmig0J1Pct
c4E+qRrHd5QPGxMJCRgbzYS7QoHcJ/qc/XOMGwK3iFFewzf1YaVTshvwejzLX2Tu
R6Wsk/vNFCM0J6YQMdtVb0wdbIpQ90Er+HILFmVf0bo4B7m5lzSL1Z1UQhsqOyQF
hsiv3hM8LzxD4Bv/iWsbp5PGQJ1tNOzGpeBrhmSPwHboxdQE3hdpsfQAJGSZkB7u
H4B8gkRnstjNIzpeCuqEcrAgnWQJL2JqCZUHQlRx3ImyMDn0NZ44125nsq+qZPQ=
=s+vV
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Sep_2011_20_27_44_+1000_+znZOHhrYtT.kgDg--
