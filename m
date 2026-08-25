Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D833FF8BA;
	Tue, 25 Aug 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664789; cv=none; b=c2ru3gML12+oYpo7aLQWQlOlMY2LtTL3QY+TvV0rKMg2Vrecup1jTOA1QMriGkUqUGT7bQGWYlS0+FVANlCDLc4bOL0R6ialkl3FklPXhNnKyhKj4V4h7W4rxBtbmulty505KLXgl2uPC0lima94t+zEtp6PUbJ+FJXBIVkreuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664789; c=relaxed/simple;
	bh=x1nvy1eZK8usd1lvKOwbpdRZuUTW7EMyaBYbUucr0Do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LtrkbwQb+NVYJTQmBahOoMSAiU9fRJeAa/8d3p2dXGIn2p3nxYeeUJK6bIIoCk/K+/6tI47OKl/aZkz1TYkzYgUqxisqw9BWFsceO/ehEoZhFzddqcwJX+Ehgcn1WMFtNEFwZMgamis4EQGMQJQ78t4vC0M70XPAhLljszMGKFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh13JpGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh13JpGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0FA1F00A3A;
	Tue, 25 Aug 2026 13:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787664788;
	bh=99Qal22Ol/KINXlIOuen6yhqifsutldtyQyqWH1vth4=;
	h=Date:From:To:Cc:Subject;
	b=Oh13JpGF+eW1RAJt53ARZaXgWlJtC5LU0VSWUzOCxxh9Vug/P4KGPtyJ4FLZcfyK6
	 4s3Ya9JMG0/aM9PURXYdWsoVR4uwoH+Z28t5LqU7Bo6yvQ0JqcuruhKK8gw6pro5Qe
	 kFTwGT5/SjYPqecrJvN3qGbr3ptfQ9/faFZf/GQYy0LWjmE56wefhRihJoPt5b5Dn1
	 06zeOZUNDiL3bSIK18g9xUHNyIWMBj+TK5HGZisymLoYSr+10eil6LaoivLaeQJV8D
	 LJ0H25t+qCS7jUQtJZyNdE0AmtkUeWF/ASrrcA9jpPXSnw+rKJReGE0z7qxrL7nijj
	 yYP3nLTAPoIBQ==
Date: Tue, 25 Aug 2026 14:33:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the kvm tree
Message-ID: <ao2ZkNr2eHlUD2RH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tSFs5LIEo/pp0gpt"
Content-Disposition: inline


--tSFs5LIEo/pp0gpt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  tools/testing/selftests/kvm/steal_time.c

between commit:

  15a9a2ba0c546 ("Merge tag 'kvm-x86-selftests2-7.3' of https://github.com/=
kvm-x86/linux into HEAD")

=66rom the kvm tree and commit:

  12c2a7f18f579 ("Merge branch 'selftests2'")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined tools/testing/selftests/kvm/steal_time.c
index bc3c62b72c58c,6e9cc0e34ec07..0000000000000
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@@ -549,7 -549,7 +549,7 @@@ int main(int ac, char **av
  		/* Steal time from the VCPU. The steal time thread has the same CPU aff=
inity as the VCPUs. */
  		run_delay =3D get_run_delay();
  		kvm_pthread_create(&thread, NULL, do_steal_time, NULL);
 -		kvm_pthread_getaffinity_np(thread, sizeof(cpuset), &cpuset);
 +		kvm_pthread_getaffinity(thread, &cpuset);
  		TEST_ASSERT(CPU_COUNT(&cpuset) =3D=3D 1 && CPU_ISSET(cpu, &cpuset),
  			    "Worker failed to inherit parent's CPU affinity");
 =20

--tSFs5LIEo/pp0gpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNmY8ACgkQJNaLcl1U
h9CfEwf/YR8EEFXhLsxCdwREuT2VX1WiAUs8Tut+u2D0KImOucXQhrplSpG7HiEk
Yh3S+FJ5JRsOGXxzYrWWSlvlga/D9A3jkHOg8P6z8ruqdfR+kcA06x/vYrmi18wJ
r0iMfczphHkVzuAR4m2MrQKZfGPNf1XIVIjuSL0zxBJ7y8azCkSlNNs6QhrOis7/
CPUXf9tislA4JrvUuQMWwTNkXAfQDcWdUBn3PBkrdqioo3kBEBvrIi0mVU5BLVpp
HD7zXUUsJb4NNeZqJW6aFIlFN6u0RiKwXqVAKMXwxhoXA31vHLen1uX2LtlvLn6/
2tt132pSOLEBF8CGL+yVEKYyHCMQPg==
=BZ4u
-----END PGP SIGNATURE-----

--tSFs5LIEo/pp0gpt--
