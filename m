From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the arm64 tree
Date: Fri, 27 Mar 2015 11:15:31 +1100
Message-ID: <20150327111531.702b331f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wiNcfLogYgUsshlOH.P.0i/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/wiNcfLogYgUsshlOH.P.0i/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

Yesterday's linux-next overnight builds (most arm builds) failed like
this:

./arch/arm/kernel/vmlinux.lds:677: undefined symbol `__hyp_idmap_size' refe=
renced in expression

See, for example,
http://kisskb.ellerman.id.au/kisskb/buildresult/12391163/ . Have a look
at http://kisskb.ellerman.id.au/kisskb/head/8631/ to see the full
carnage :-(

This has been happening for a couple of days and then before that we got:

/opt/cross/gcc-4.6.3-nolibc/arm-unknown-linux-gnueabi/bin/arm-unknown-linux=
-gnueabi-ld:./arch/arm/kernel/vmlinux.lds:544: syntax error

We are using gcc 4.6.3 and binutils 2.22 to do these builds.

I have reverted

12eb3e833961	ARM: kvm: assert on HYP section boundaries not actual code size
e60a1fec44a2	ARM: kvm: implement replacement for ld's LOG2CEIL()
06f75a1f6200	ARM, arm64: kvm: get rid of the bounce page

from linux-next today.  Please address this ASAP.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/wiNcfLogYgUsshlOH.P.0i/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVFKEpAAoJEMDTa8Ir7ZwVE2AP/Rw2/vpzpwxaU1p8dM925fLq
iPRqp+RI/yf4JY/vwZyxfgOi7AQqqjkk0VqUsvWyxQOfCMMYVSgBgzTIFk0CFx1K
VpQPt5h4Guiu76eTz22ObFmVZXkaZyExKRPKj88tvTRifOu3hXR2GqgzTbYeC9Ga
P+crCpX5hHvhnUvF1B284D97rLeslSfnvUV145iezaIYq2sPuUCwOZtoXmqhOV2f
ti0BezNmoLaS9QmI12468bkUblcXuU5fOkGKoC8T60lJO9lJFcSdxGb3gr169Ax3
OorxsqHOrlQC/XzSBqDDeq9LRGg52BGpDXrZHaX4qzn39CUUlNCqiJwdtclk+ZXC
NLNz5FYqYQfk5sonvD+qNxFhLGPTAkF3QpAWRZoBlacXlHtG+f4hGLvWLJrbqzU+
3HdvBy0rArCbRvj0wYs4V0t0iqwB8aVj+vbZ2R4nGY28ERmwaSmgJ3/7Pw0I83dG
LnwVesmzYJ9phpkdsrBwuagr54s2uD+DZsR7O2wi8XA9EW872YDv1qzvHOFeVnG4
IXJu5Q4qWhj5b9DsmMoOvW+guR/zETmce1DZsjWQSd4J31fI8zNF5ShjX7iwdwar
rLYo+31+belU9E1oZOeXEZ8beTmwrsQ8s/ouod3mLdvF5NFyLEbs+SxLfbHDJEOs
wihvPwpcno3UnMip3GRe
=yDHp
-----END PGP SIGNATURE-----

--Sig_/wiNcfLogYgUsshlOH.P.0i/--
