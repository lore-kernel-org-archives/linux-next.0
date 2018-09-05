From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the devicetree tree
Date: Wed, 5 Sep 2018 10:39:06 +1000
Message-ID: <20180905103906.232545a4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Kh_LlWW9MmhSB11lcET/Gpt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Kh_LlWW9MmhSB11lcET/Gpt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

After merging the devicetree tree, today's linux-next build (x86_64
allmodconfig) produced these warnings:

WARNING: vmlinux.o(.text+0xf40a16): Section mismatch in reference from the =
function of_fdt_limit_memory() to the variable .init.data:dt_root_addr_cells
The function of_fdt_limit_memory() references
the variable __initdata dt_root_addr_cells.
This is often because of_fdt_limit_memory lacks a __initdata=20
annotation or the annotation of dt_root_addr_cells is wrong.

WARNING: vmlinux.o(.text+0xf40a1d): Section mismatch in reference from the =
function of_fdt_limit_memory() to the variable .init.data:dt_root_size_cells
The function of_fdt_limit_memory() references
the variable __initdata dt_root_size_cells.
This is often because of_fdt_limit_memory lacks a __initdata=20
annotation or the annotation of dt_root_size_cells is wrong.

Introduced by commit

  bb35ea5c7c30 ("of/fdt: avoid re-parsing '#{address,size}-cells' in of_fdt=
_limit_memory")

--=20
Cheers,
Stephen Rothwell

--Sig_/Kh_LlWW9MmhSB11lcET/Gpt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluPJaoACgkQAVBC80lX
0Gzh6Af/QDDMVaAfxbf168H/AYUXHvRK3qNDVmGN/D3m3gHb5Vk3idGK0G+A/yJF
oENDTp1VcQmB3Q7xbl+XfqgPzjpwFlJH3P/3BmUqaVQVg9A+f/sJY+J9tEbhkf5D
lilB3VWnSkXNnL5n2ULtlhfDKO+EZVK+cEAhSvyTKVQQVj7a2n6bFuD/iLvLgGdK
KlQWs+Q3a/fc+i9YsWXoPG8mXtIUPrVMB5B5SNZnBZ/1z7fb/ghuFii1SY2UvQ/t
ILJO02nHQKz7FqQOawVCRkSWn749RXUbDi5fReE5FczDoILijRfARoKXmDFEeCc2
GMQiiFM4ZJwz9vRO6FJ5nbZ6yJGXUw==
=CJet
-----END PGP SIGNATURE-----

--Sig_/Kh_LlWW9MmhSB11lcET/Gpt--
