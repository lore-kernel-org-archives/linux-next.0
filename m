From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] ARC: Fix earlycon build breakage
Date: Wed, 4 Feb 2015 13:27:37 +1100
Message-ID: <20150204132737.391a8eeb@canb.auug.org.au>
References: <1423012132-9149-1-git-send-email-peter@hurleysoftware.com>
	<20150204011635.GA26214@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8CwDsmst3TKF9ltchUqvBIr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150204011635.GA26214@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Hurley <peter@hurleysoftware.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

--Sig_/8CwDsmst3TKF9ltchUqvBIr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, 3 Feb 2015 17:16:35 -0800 Greg Kroah-Hartman <gregkh@linuxfoundatio=
n.org> wrote:
>
> On Tue, Feb 03, 2015 at 08:08:52PM -0500, Peter Hurley wrote:
> > Commit ffb7fcd66f14 ("ARC: Dynamically determine BASE_BAUD from DeviceT=
ree")
> > breaks arc:defconfig build:
>=20
> I don't see that commit id in my trees, so why send this to me?  Where
> did you find it?

It comes from the arc tree.  So, yes, not your concern.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/8CwDsmst3TKF9ltchUqvBIr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU0YOeAAoJEMDTa8Ir7ZwV3+YP/R8GWL+3b/1+sk7I7hyAnsY9
bq1v3zv7bdwvW+tU/r72puhhk37nxvwytDerz6a2IvKyCw5D41yzz35OKiJCpYq0
7usMox5qnEnNxBU7AIzjmN5hIUGACjjPahgoB0QuWGBLnekq0TEdl7rd7s6RVkoq
EX+axj+dv/fRVCyYkUMncut7NC+wB6vWQA9rdy8DiZRQNd8Npawam/txLU7vwxt1
FfrPn0YRiCB966xGU+Uqh3H08QwA4z0zyszdxL7Q1NnGVr8nnAiGa6ntJJS2Q3D3
HR5ixscOdtGcZpUCYJvW+dLfmxEUwVFmcMgUNv4Fd2+9JlNAl4auvqcc9ByCl2wo
fYY69zYP9OsWfek1U8boclw+yH8vHzGlH1Y8aKSQWnFfapDCRTEi1wu9ggYHpVh4
Cj6kTmFrFGn9WNuDmrjUE6RBXCHCvM/QRGFVtVbb+ceIZnQybu6q1TOrfj03mxV5
EHNE7bMfRPXrPw5hujyyffq9OAr/tt6h2ZU0tyrV9zEHxbRfFedWO+Eb9IIhJFhR
j5Hj3Axs7BNvaOzMtdt3G97yHdS6nqcPwLrOTh3hUHL2Vk6HyG/qxeWYH/Or/bwW
CMoOxlgc3oB0LrIy626Ebeqr8l2d4L/PsElb/r1nqAGQLIViIv+zhm38t4E7cQ+S
vvsp0Lil9YyOtrQFr93M
=xUtw
-----END PGP SIGNATURE-----

--Sig_/8CwDsmst3TKF9ltchUqvBIr--
