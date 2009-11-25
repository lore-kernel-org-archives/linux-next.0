From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: percpu tree build failure
Date: Thu, 26 Nov 2009 00:04:11 +1100
Message-ID: <20091126000411.8fa198fd.sfr@canb.auug.org.au>
References: <20091125234133.4d603f48.sfr@canb.auug.org.au>
	<4B0D29D9.1090809@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Nov_2009_00_04_11_+1100_/2=ix_arjpYTG_JN"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934682AbZKYNET@vger.kernel.org>
In-Reply-To: <4B0D29D9.1090809@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Vivek Goyal <vgoyal@redhat.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__26_Nov_2009_00_04_11_+1100_/2=ix_arjpYTG_JN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Wed, 25 Nov 2009 21:58:01 +0900 Tejun Heo <tj@kernel.org> wrote:
>
> The change was missing asm/io.h include and the fix commit was
> incorrectly attributed to me.  Fixed both problems.

OK, thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Nov_2009_00_04_11_+1100_/2=ix_arjpYTG_JN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksNK0sACgkQjjKRsyhoI8x7BgCfdzmKflDncFS+eM3QOQiFaXFx
1JkAn1hs5YjkN1EfL7cPgX/hwHD+ic/b
=dNn8
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Nov_2009_00_04_11_+1100_/2=ix_arjpYTG_JN--
