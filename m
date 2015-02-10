From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: make mandocs build failure with next-20150210
Date: Wed, 11 Feb 2015 07:27:57 +1100
Message-ID: <20150211072757.166344e7@canb.auug.org.au>
References: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bVf484jV1jIgGJR/bNm0/3x"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhhXpFWsBJohzyseUh1bVj51HcjzMPejY0wzmjgSvhaOHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>, Alan Cox <alan@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/bVf484jV1jIgGJR/bNm0/3x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Tue, 10 Feb 2015 11:40:23 -0700 Jim Davis <jim.epost@gmail.com> wrote:
>
>   DOCPROC Documentation/DocBook/device-drivers.xml
> docproc: .//include/linux/i2o.h: No such file or directory
> make[1]: *** [Documentation/DocBook/device-drivers.xml] Error 1

Presumably caused by commit 2cbf7fe2d5d3 ("i2o: move to staging") from
the staging tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/bVf484jV1jIgGJR/bNm0/3x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2mnSAAoJEMDTa8Ir7ZwV5SAP/0rYwZuonEcklyKje00qSgFo
2MRHm3MTxymXFdfkyQEgWFgAz5RWgZ8/B+AHS3RuR7J9cd9wai7fqL6z56pnoa0y
2ObbjRko+e1UH0WqI/EL6KKlr117NmZXpSpHzaDlmL91QWV9zowJ+iBM8nvv1TKY
LXdAfcB24Xc1Y06wKvO2JxDnxHkcf1cObdlHSMiHkzXm1PsyZwHAu5A5Jr+RWsfH
2dMtt2mJsLryd/t0dtsJuW4Py3eI4M6+CGzbrd1DzVePy9h4UzOyxgOvRuVG9hy0
RTzT+MqkMJuV7ZQY6gn6nRBmdOo7yr7ce1ZV3ddU3SFjNlS72sw+TFyhQxf/vJzJ
08cDCC8y2hSq74+WsiVpYnF08Jy9XBvdsI0lmWEBFOeFwkyTb6SD5sOCn23GAAEh
GhnyFUOshXL2fRrhU5MnrIgXM/WKdrUv8ay1fpqhxmRvbbE+7bvtuas+/w9WDOSJ
JCc0YAJr3OCfq3VNDNmzYA4I8sKv8/iMovBWgIZFUXjMcv7HybqOzgVzuP9uttmc
BaFUzWTDLHyz4kdoM07bEkADboqtz1fNOH6h3t26Efubkt9amTSeMUnTua0rnNDf
SyBpiLpg31Su2mmVVPXdlF7TokDhTMzUy8jc1J3VYs3OmT2QKt4CmhQ7vBG2jeQl
9nZNMcV+VfqTRQmDpr54
=Cxz/
-----END PGP SIGNATURE-----

--Sig_/bVf484jV1jIgGJR/bNm0/3x--
