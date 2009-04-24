From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Next April 24 : BUG: lock held at task exit time!
Date: Sat, 25 Apr 2009 00:11:56 +1000
Message-ID: <20090425001156.04781613.sfr@canb.auug.org.au>
References: <20090424150456.ff35e4ea.sfr@canb.auug.org.au>
	<49F1626D.6080102@in.ibm.com>
	<20090424175509.561c96ad.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0904241249180.20196@blonde.anvils>
	<20090424140445.GL8633@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0095665947=="
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org>
In-Reply-To: <20090424140445.GL8633@ZenIV.linux.org.uk>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Mime-version: 1.0
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@ozlabs.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: peterz@infradead.org, LKML <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Hugh Dickins <hugh@veritas.com>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-next.vger.kernel.org

--===============0095665947==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sat__25_Apr_2009_00_11_56_+1000_20Mo0V88ywKEUH1j"

--Signature=_Sat__25_Apr_2009_00_11_56_+1000_20Mo0V88ywKEUH1j
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Fri, 24 Apr 2009 15:04:45 +0100 Al Viro <viro@ZenIV.linux.org.uk> wrote:
>
> Applied, will fold on reorder (since Ingo is asking for what will amount
> to reorder anyway).

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sat__25_Apr_2009_00_11_56_+1000_20Mo0V88ywKEUH1j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknxyKwACgkQjjKRsyhoI8zrOQCeKftgvHyAwioSUsPqttVFONXA
UnIAnRvQjpbBX6SCdzoTe9QEe18DVpSV
=EEhI
-----END PGP SIGNATURE-----

--Signature=_Sat__25_Apr_2009_00_11_56_+1000_20Mo0V88ywKEUH1j--

--===============0095665947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linuxppc-dev mailing list
Linuxppc-dev@ozlabs.org
https://ozlabs.org/mailman/listinfo/linuxppc-dev
--===============0095665947==--
