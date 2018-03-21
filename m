From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the ftrace tree with the jc_docs
 tree
Date: Wed, 21 Mar 2018 15:37:15 +1100
Message-ID: <20180321153715.3a571e5b@canb.auug.org.au>
References: <20180321153127.23737f6e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K/6gSSjIJVnbi_P4h35LFAG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321153127.23737f6e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Tom Zanussi <tom.zanussi@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/K/6gSSjIJVnbi_P4h35LFAG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 Mar 2018 15:31:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the ftrace tree got a conflict in:
>=20
>   Documentation/trace/ftrace.txt
>   (converted to Documentation/trace/ftrace.rst)

There was another conflict involving

  Documentation/trace/events.{txt,rst}

Unfortunately, I accidentally deleted the report email before sending
it :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/K/6gSSjIJVnbi_P4h35LFAG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqx4XsACgkQAVBC80lX
0Gw6IQf8COFNIdCXK/phLf14jPee8s2CteMCz9x7mRjWpe342Q+BQ2mshE7VeXNz
N775gdN/+eP8V/SBOg+czpY/zozppBqJa1y8gOH6JThoY1OiIja+OcP0UgDr5CoE
2Y9f4YkAc5SolIpKPo5pcHabJZfUH7ml0y38m9jHZycWIbF5lTJnJPBPlSOQ49yU
KKduEigvj5DaSbo97MvDvC95PrkcqX65MjqvhKwcbm3FleuJEfdy4uwacXolojHp
u4IhrphdosPKYGujsd1bePdIVQqBa3VVbVv7sWI5jEW1cW0G/Zbub2CdDhTOnKXd
0m5MyFqU3viaQHrf907x1/auwePM8A==
=OcHy
-----END PGP SIGNATURE-----

--Sig_/K/6gSSjIJVnbi_P4h35LFAG--
