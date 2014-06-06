From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-integrity
Date: Fri, 6 Jun 2014 17:56:29 +1000
Message-ID: <20140606175629.11d3b96d@canb.auug.org.au>
References: <1402026956.5458.130.camel@dhcp-9-2-203-236.watson.ibm.com>
	<20140606142255.76bc38f1@canb.auug.org.au>
	<1402031469.5458.162.camel@dhcp-9-2-203-236.watson.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7E/idB.U2VplC7dCU.SV5y1"; protocol="application/pgp-signature"
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <1402031469.5458.162.camel@dhcp-9-2-203-236.watson.ibm.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: linux-next <linux-next@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/7E/idB.U2VplC7dCU.SV5y1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mimi,

On Fri, 06 Jun 2014 01:11:09 -0400 Mimi Zohar <zohar@linux.vnet.ibm.com> wr=
ote:
>
> On Fri, 2014-06-06 at 14:22 +1000, Stephen Rothwell wrote:=20
> >=20
> > On Thu, 05 Jun 2014 23:55:56 -0400 Mimi Zohar <zohar@linux.vnet.ibm.com=
> wrote:
> > >
> > > Please include
> > > git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity
> > > #next in linux-next.
> >=20
> > OK, it would be good to know what that tree is about=20
>=20
> The linux-integrity measures, appraises and enforces local file
> integrity, and audit logs file hashes based on policy.  The
> linux-integrity subsystem is upstreamed and pulled into linux-next via
> linux-security.  A suggestion was made to have the linux-integrity
> subsystem pulled directly into linux-next.
>=20
> > ... also it is
> > really late for inclusion in v3.16 even - I generally do not add trees
> > to linux-next during the merge window.  This does not mean I won't
> > include it if you can convince me otherwise ...
>=20
> 8 patches, mostly bugs fixes, are queued to be upstreamed
> http://marc.info/?l=3Dlinux-security-module&m=3D140128032831578&w=3D2
> Please add the linux-integrity subsystem at the next feasible
> opportunity.=20

Added from Tuesday.  I have just you listed as the contact in case of
problems with the tree - let me know if anyone else should also be
informed.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/7E/idB.U2VplC7dCU.SV5y1
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTkXQyAAoJEMDTa8Ir7ZwVqngP/REU4mN/5wyfArO6SK6F4sGX
kD0LWkVLih0qrN7i0uMP5a8heE5YIW3BEwsABcOfvrFAiNrn+jSCJ8FO3qQDe/PC
0qKB09ycrXKhljIlxIeunTtLsp1O7DpI/V35cPVigYfbDVYHuiCMuiCrr4FIvbzy
wU8J+iFmhopwoA+WYEfPfU7w8xYPBSgN+qvEvPANFXtdYTrTBGU4ltXa97CoQy8n
Qifr1MKMrvHveQConj9R+Q8DlpPqAHU7R4rACkYJOc+ZxdtyVLs6nB3SWXZDn4Jb
nihf7N6lgg7LhLCgqhXzxpg9yLLKrFA9aw2puoj5JzKcmGuNa9QhYfGocJNUWgMw
FFkEi3yUhSRELMjwEIJaczTzZWeXjJ/394Ifk39ofISV4a/UDCxI3g4Wn3R9YlG8
h86uqPv0qwHTM5gzOFlksZQBW3ZiU5fs2AeKs/ggIceEelSq4Q7gumVWGt9f2ZGP
HZzc6w3NZ3XbPT3tGBRiHJ9ITbXhPtsvWeQVT8HmIZjPkh52oIYF/ktNg3GMNgfP
8FCMj4cJp7OlB7PjMlyd+fYfCnM1vUdLG5AXo6AVOko5skI5OqJ2e17Jw7pJ0nXz
0ZetWPyChYeRXPm/evPNGQe4X8qy6cv0B/Uy2ZjbGnmhe+4ZZe5u/SYmFvq+Rfk+
Eae80C8+46bkqqwZkXmo
=vuWn
-----END PGP SIGNATURE-----

--Sig_/7E/idB.U2VplC7dCU.SV5y1--
