From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kvm-ppc tree
Date: Mon, 4 Aug 2014 20:36:18 +1000
Message-ID: <20140804203618.67a5ba54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DB91MxlzTSFlys+U=FBcQ7n"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Graf <agraf@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Sig_/DB91MxlzTSFlys+U=FBcQ7n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

After merging the kvm-ppc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

arch/powerpc/kvm/kvm-pr.o:(__tracepoints+0xa8): multiple definition of `__t=
racepoint_kvm_ppc_instr'
arch/powerpc/kvm/kvm.o:(__tracepoints+0x1c0): first defined here

Caused by commit 29577fc00ba4 ("KVM: PPC: HV: Remove generic
instruction emulation").  I note that this commit has no Reviewed-by,
Tested-by or Acked-by tags and only one Signed-off-by tag.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/DB91MxlzTSFlys+U=FBcQ7n
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJT32ImAAoJEMDTa8Ir7ZwVmpAQAI9qaZRTQRMlPCLziVd/Rp4e
95I0uHZzUrhQPST3MD17BiABmT+h7H+IWJ5Jex7URLHiO2m0NPMOLw0/kTs26/k3
xiidKi/N2zkdfG+UBJkeS3Cx+yRIiYbilW4TeHALkLWp85FYlOGT5NBaRs4tNjO9
BslBYcyMFeBHZ+OmyZOiHKiMlg9UygM1KksCv527GTHKZ6EnxtnKnWfWCH2TnYrV
+Q/L0K4UbVzjRBEMimgsXUhyDz1dLXgEPrG9CaJAVfOvYuecSMM/6bbMVjtvQFqQ
5FqykXsF5BbXoA9BugmQ5d+qV+QozsJkeo1ycEryf2+Wx3IfCPRn8IuBh8Baz2yc
z3uGZB3yikQ7q76oED8JynVqQo23ltxvJpHr7QzoIyiRdY+uliHM6rNtceR40H+Q
42uraqJ/n8wAIqrrWNqK+DGsAim31JSPNPBnQ8S5jOrUmNrrTzUxOmhhnKzjvucM
v1U8w1XI2qZSKM490kPLpELleGlSjlSAEdFmM+E+xAyG2pp3C8WnqEaZioWJuq2n
XsVXLzfVBYTzv29ugbD8EOby/34zri1WlHTzGjrT1P+Ixvh5rQKPL3iiQxNSCmRS
QdZOooWmGfqjyBXHih4R+UdgiliqeyH01a5GCxqh8X67ZQpeoLgGsMMeSuaB/XX4
cvv+vzRZWAnNUMCMSv5J
=2Gbn
-----END PGP SIGNATURE-----

--Sig_/DB91MxlzTSFlys+U=FBcQ7n--
