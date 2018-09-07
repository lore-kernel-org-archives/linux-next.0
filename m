From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the bpf-next tree
Date: Fri, 7 Sep 2018 10:19:23 +1000
Message-ID: <20180907101923.4d2a85c6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qSYX_iRFPcE6o1KMvibSdYY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBl?= =?UTF-8?B?bA==?= <bjorn.topel@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/qSYX_iRFPcE6o1KMvibSdYY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bpf-next tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: ".xsk_reuseq_swap" [drivers/net/ethernet/intel/i40e/i40e.ko] undefin=
ed!
ERROR: ".xsk_reuseq_free" [drivers/net/ethernet/intel/i40e/i40e.ko] undefin=
ed!
ERROR: ".xsk_reuseq_prepare" [drivers/net/ethernet/intel/i40e/i40e.ko] unde=
fined

Caused by commit

  9654bd10da60 ("i40e: clean zero-copy XDP Rx ring on shutdown/reset")

CONFIG_XDP_SOCKETS is not set for this build.

I have used the version of the bfp-next tree from next-20180906 for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/qSYX_iRFPcE6o1KMvibSdYY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluRxAsACgkQAVBC80lX
0GwmEQgAiWmG1iITZcZF5FhWViHP1MiECvbv99kcl3NYUqxLPR0lMdtLkJbGxESd
+iSKb3AKxA2VFOh0xMSfxQbsTP/vw/WFoejIDk72q+VefR7pppkPf7VsCPsW4cdx
HZoUdPoTD6Z18iid7oGirCxr1JF9jgBaOWdcA3x8fn0v8IjZNfSNOriqkDQ7+mbj
wxsSiM08vcTINF9K/vWqf/6zgYpn7Xq6AG6opT7nmxZ1vr9qkUVXj28hPmUwWYNK
46703M6iZhLkMF47kgCNc68z2B1o91u+wa8vwoOCE90hlODw226DSeRHj9s0eopN
d5xGNXHbdspVN43ORS0ZFiuovMi+oQ==
=C2jJ
-----END PGP SIGNATURE-----

--Sig_/qSYX_iRFPcE6o1KMvibSdYY--
