Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC617BED0;
	Wed, 25 Mar 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441947; cv=none; b=bIZ3ijXm91dED680UzIvOB7V/0lklKNyd5HXEgUV8ufoVbb55ypv3Jtrf//qYVQz1ApcHZ7KubERHWcUuAoESesjo2A1il4shSHjJuhDNwHDtRvdP+sqmOmYDNC+h+r79kJ8GydKzIX8aYpRXFMsawy3yoQMf7RJ57dohbVZNdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441947; c=relaxed/simple;
	bh=FHdoLeLrsrlUr/3V7FwQS9uicqWJb5noKQynNBR6gtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FKEOVHAgOUAKULEUGeHP2Sburu61boIKJ1q+Iup6gXwmbLnRo4tuscZzmz5C5SYzyzv1sQMR8vdRb71A4XzzlAfBedIvwq2barSwIoV34+kHh2wYixQjY+wwXWAAl225JFa4w9nvm2W8znsny6CC0RE+IOGLBpckubw69FQIAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiQkHfAV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiQkHfAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51308C4CEF7;
	Wed, 25 Mar 2026 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774441947;
	bh=FHdoLeLrsrlUr/3V7FwQS9uicqWJb5noKQynNBR6gtU=;
	h=Date:From:To:Cc:Subject:From;
	b=JiQkHfAV81Q3+rxsA1lB2ywpsEUBzFw+Z1c1dos5vZjxJoKfEZM8MAXN3dXxVTfaE
	 Y9YnAAF1sWrb255QKe9jFuSULiq8JNtvZvma4zs1Rwx2JiOT9AjmqRsTASd4ilRgSy
	 HpGGvbdwTz+UwTOc1G+sdR90ONBg4Jqt3LK+j9Kf0OALDbeptMmT9Sg2P3RfnagiQ4
	 dUkL1+9x1UaihieBgUE74Tvhtj3wRUWv82OCm8PjM7Lpzz2hxrwXTIq19aq9G5zalN
	 UAWXk8BMRZgcSEf/+PEIeT9aKVcexPEvYqYMFoPCxIgSSO5ZfbN05OrFVEoWwSjHlJ
	 Cr6T8czohfIJQ==
Date: Wed, 25 Mar 2026 12:32:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <acPV19IY3Gna6Ira@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="byGRgxhCMrP/HDhs"
Content-Disposition: inline


--byGRgxhCMrP/HDhs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(arm64 kselftest) failed like this:

In file included from listns_efault_test.c:23:
../pidfd/pidfd.h:229:19: error: static declaration of 'wait_for_pid' follows non-static declaration
  229 | static inline int wait_for_pid(pid_t pid)
      |                   ^~~~~~~~~~~~
In file included from listns_efault_test.c:22:
../filesystems/utils.h:47:12: note: previous declaration of 'wait_for_pid' with type 'int(pid_t)' {aka 'int(int)'}
   47 | extern int wait_for_pid(pid_t pid);
      |            ^~~~~~~~~~~~

ie, a new instance of a similar issue (probably masked by the build
system with the earlier issue).  This is due to a conflict with the
preexisting wait_for_pid() in pidfd.h triggered by:

   32f54f2bbccfd (selftests/filesystems: add tests for empty mount namespaces)

I am continuing to use the tree from next-20260312.

--byGRgxhCMrP/HDhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD1dYACgkQJNaLcl1U
h9DmkAf/Vc6VoihCeS1SzehwsS32ILROv2DvtMORgoAkRbBFzoRNYapvC9bRJY+D
8LQXVAn2k5/5Vl9upngjS9N3FLRKaFxkjyIRlvSqM1tJccssK9F17PdrAxJe1XDX
sDW1AF9cBMlxt9TRxdIGhin6ixOibIjKCPP1wRRWxUXCGZ2EqMN4vXVk7uVGptfF
wqMw9S0dhUHt4WnVUIn7S7awKDE8152oE0v5YQmy3FIOBkTurFNS2+x7mhenUQkX
FaO3zqewZkU8wr1VJBoxWHM4g8TjNtt8foApoTi8DnWbZYIub6YSzv5tNJsZgTgE
QhmutA0VGePyqN7Se3OeGgxYNN5VOg==
=ZI2B
-----END PGP SIGNATURE-----

--byGRgxhCMrP/HDhs--
