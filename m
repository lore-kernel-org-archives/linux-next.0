From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dt-rh tree with the mips tree
Date: Fri, 27 Mar 2015 15:25:36 +1100
Message-ID: <20150327152536.23f0a8b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/T_FZPPd5aC2AjxxSZAbBFLC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/T_FZPPd5aC2AjxxSZAbBFLC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Today's linux-next merge of the dt-rh tree got conflicts in
Documentation/devicetree/bindings/mips/brcm/brcm,bcm3384-intc.txt and
Documentation/devicetree/bindings/mips/brcm/brcm,cm-dsl.txt between
commits b43a3ff04e59 ("MIPS: BMIPS: Delete the irqchip driver from
irq.c") and faf18d2dd323 ("MIPS: BMIPS: Update DT bindings to reflect
new SoC support") from the mips tree and commit 23a71fd616bf
("dt-bindings: brcm: rationalize Broadcom documentation naming") from
the dt-rh tree.

I fixed it up (the mips tree commits removed the files) and can carry
the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/T_FZPPd5aC2AjxxSZAbBFLC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVFNvIAAoJEMDTa8Ir7ZwVSY0QAIzrq/6ekwVUw7r3oWPt6w62
HnXXxZyF5znNduqRSL1Q4XmAxBn+eqlAeU3DzzgjQN5bFb2qOaMoJ87XUveZMtQj
8ApWZDqveeLecf5pHckUg2s2R7gE38kpgS+xTIDcSzdI2LcLUTHVvfT1j9jItk/8
x3mhSbSjAaeQI6ZxxGHAQRKPOgF1I7fT0snJuGpu+DKntgiP7zAWcplVm+CKE4Gv
GYEKEcY4+bdAa5tj4NpVJczQpjtYmr2YNHgvrW3qJQ9GKdvorgHNDtFQsmoMexFn
NWTfLd2vw+R0luHRICN6LEDqpbpR85q6+FC8xM/imtuCT/fx8GA7qVb1WH0mXf1L
cZAry+kkEUK1+CouXaDziqtyTE/kXD7MXRHdbgptW18VF7CFLsiFqtOIGse8ryhV
S8YEbO9ykEwuzSPTXp9S/XuDmKE1DsgPRDz9pTOu0aJGgZYGchITq3esgJ2m1naB
ftaJrY1YbByc1rleEUcKoZVio/8idZQpXb1oP6s5MFTEU2gbC4riLb4EWFMTxtQ+
ZUFFwzxm6RGkqdmmN9NFZgq380bq6XEyjQjmZvGbqxXGSuT4B7oHkDi6+vKtskyb
Sj6Lqi6HZJxyyXAVJfzwLQxFcLsWkNit3NLMet3BRDVc1nUWne4q0hHyDJ25Fhha
E2Vq6qh91yHccKdWsRgV
=fIHm
-----END PGP SIGNATURE-----

--Sig_/T_FZPPd5aC2AjxxSZAbBFLC--
