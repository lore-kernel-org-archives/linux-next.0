Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644083BE17B;
	Wed,  1 Apr 2026 10:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039639; cv=none; b=llMPRByzW8JXnrRg8WPk9ZPBYnap+dXjP9lpsQr/Aa8+RrzsPcuYCYv6ovusVuT0rR7gruo7jA/FVq1rf42ipMjKJq40XArq2O7XHDQgxsEgXKS+qSu2FrP9UrQGJogh8qT3DP4tMHqcPATLeycL97aEPTpuBHeCSHEy7fxQApg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039639; c=relaxed/simple;
	bh=Jv+UGtvlDu+Wxpd209XGI2viyxDihlkbGM4ywl/J7Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRp2GcIcQse3jM+/che2pIhkuPSR75TnjgbvQX68F6a/VMP5fotvAcF2c/4b7JQ6daGZUDxPWhXMkIUd7IpCQXzeGAU+XC0aJ5/28E3Uu+xNXMKQbFavOvwVnt556O5HbsYdxWXXXEFDDxKA61kuSqDH53cNsIPoJFLxZ7/HzMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqIEdSsr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqIEdSsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99955C4CEF7;
	Wed,  1 Apr 2026 10:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039639;
	bh=Jv+UGtvlDu+Wxpd209XGI2viyxDihlkbGM4ywl/J7Nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqIEdSsrx8DkqTriGq+H5SqlxGhELN1ozZITlevPz8ZjCNEAREbIFjrN6kqIkCy28
	 pI8CmNhWVIGbw7MDNrtz3+MrMzLwLxsRbwD33X1hRbrnLfUzkvUTp7PYlbffEkBq8n
	 mizHZxfgyQHhzzBSG5fMhsym6rqAvtaGxm/YDiHBNauYRWCiIbKz13fqBDkRnAgTmb
	 pY0OYeADuDjAmmrAa0kOiNlrCrcN+w7KrggfWD+AgOWmr1rpHuypBUugDiTI1kkRuZ
	 yuVMANzon3TUnUPY67dBQ60UChZNGnrOQa6cNJJ5sVjvgDNY5WD3Fu5HPeVXnarHYZ
	 WZgjpTc6dcCOg==
Date: Wed, 1 Apr 2026 11:33:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shuvam Pandey <shuvampandey1@gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
Message-ID: <b6b554ce-6365-4012-a18c-e7a071fc3b4f@sirena.org.uk>
References: <aabpbnOt9nCuQrfu@sirena.org.uk>
 <e305159b-13fc-4084-bcbe-968388575627@davidgow.net>
 <fbf16249-5b2d-49fa-aaa6-95e0e856cf66@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hfNC1pDvprs7gibH"
Content-Disposition: inline
In-Reply-To: <fbf16249-5b2d-49fa-aaa6-95e0e856cf66@linuxfoundation.org>
X-Cookie: "Yo baby yo baby yo."


--hfNC1pDvprs7gibH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 01:36:47PM -0600, Shuah Khan wrote:

> Apologies - this got buried in my inbox.

> Mark, Can you send me the diff for the fix you put in..

commit b0fac824fa7047bc4e71e2f40d005f40ca03b3e5
Merge: e12aa2398ae4 fa2c3ed5f079
Author: Mark Brown <broonie@kernel.org>
Date:   Tue Mar 31 13:54:54 2026 +0100

    Merge branch 'kunit' of https://git.kernel.org/pub/scm/linux/kernel/git=
/shuah/linux-kselftest.git
   =20
    # Conflicts:
    #       tools/testing/kunit/kunit_tool_test.py

diff --cc tools/testing/kunit/kunit_kernel.py
index 2998e1bc088b,c3ebb0ac1116..2869fcb199ff
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@@ -345,11 -346,15 +346,17 @@@ class LinuxSourceTree
  			return False
  		return self.validate_config(build_dir)
 =20
+ 	def _restore_terminal_if_tty(self) -> None:
+ 		# stty requires a controlling terminal; skip headless runs.
+ 		if sys.stdin is None or not sys.stdin.isatty():
+ 			return
+ 		subprocess.call(['stty', 'sane'])
+=20
  	def run_kernel(self, args: Optional[List[str]]=3DNone, build_dir: str=3D=
'', filter_glob: str=3D'', filter: str=3D'', filter_action: Optional[str]=
=3DNone, timeout: Optional[int]=3DNone) -> Iterator[str]:
 -		if not args:
 -			args =3D []
 +		# Copy to avoid mutating the caller-supplied list. exec_tests() reuses
 +		# the same args across repeated run_kernel() calls (e.g. --run_isolated=
),
 +		# so appending to the original would accumulate stale flags on each cal=
l.
 +		args =3D list(args) if args else []
  		if filter_glob:
  			args.append('kunit.filter_glob=3D' + filter_glob)
  		if filter:
diff --cc tools/testing/kunit/kunit_tool_test.py
index f6383884c599,bc24134f40a1..267c33cecf87
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@@ -503,32 -503,48 +503,74 @@@ class LinuxSourceTreeTest(unittest.Test
  			with open(kunit_kernel.get_outfile_path(build_dir), 'rt') as outfile:
  				self.assertEqual(outfile.read(), 'hi\nbye\n', msg=3D'Missing some out=
put')
 =20
 +	def test_run_kernel_args_not_mutated(self):
 +		"""Verify run_kernel() copies args so callers can reuse them."""
 +		start_calls =3D []
 +
 +		def fake_start(start_args, unused_build_dir):
 +			start_calls.append(list(start_args))
 +			return subprocess.Popen(['printf', 'KTAP version 1\n'],
 +						text=3DTrue, stdout=3Dsubprocess.PIPE)
 +
 +		with tempfile.TemporaryDirectory('') as build_dir:
 +			tree =3D kunit_kernel.LinuxSourceTree(build_dir,
 +					kunitconfig_paths=3D[os.devnull])
 +			with mock.patch.object(tree._ops, 'start', side_effect=3Dfake_start), \
 +			     mock.patch.object(kunit_kernel.subprocess, 'call'):
 +				kernel_args =3D ['mem=3D1G']
 +				for _ in tree.run_kernel(args=3Dkernel_args, build_dir=3Dbuild_dir,
 +							 filter_glob=3D'suite.test1'):
 +					pass
 +				for _ in tree.run_kernel(args=3Dkernel_args, build_dir=3Dbuild_dir,
 +							 filter_glob=3D'suite.test2'):
 +					pass
 +				self.assertEqual(kernel_args, ['mem=3D1G'],
 +					'run_kernel() should not modify caller args')
 +				self.assertIn('kunit.filter_glob=3Dsuite.test1', start_calls[0])
 +				self.assertIn('kunit.filter_glob=3Dsuite.test2', start_calls[1])
 +
+ 	def test_run_kernel_skips_terminal_reset_without_tty(self):
+ 		def fake_start(unused_args, unused_build_dir):
+ 			return subprocess.Popen(['printf', 'KTAP version 1\n'],
+ 						text=3DTrue, stdout=3Dsubprocess.PIPE)
+=20
+ 		non_tty_stdin =3D mock.Mock()
+ 		non_tty_stdin.isatty.return_value =3D False
+=20
+ 		with tempfile.TemporaryDirectory('') as build_dir:
+ 			tree =3D kunit_kernel.LinuxSourceTree(build_dir, kunitconfig_paths=3D[=
os.devnull])
+ 			with mock.patch.object(tree._ops, 'start', side_effect=3Dfake_start), \
+ 			     mock.patch.object(kunit_kernel.sys, 'stdin', non_tty_stdin), \
+ 			     mock.patch.object(kunit_kernel.subprocess, 'call') as mock_call:
+ 				for _ in tree.run_kernel(build_dir=3Dbuild_dir):
+ 					pass
+=20
+ 				mock_call.assert_not_called()
+=20
+ 	def test_signal_handler_skips_terminal_reset_without_tty(self):
+ 		non_tty_stdin =3D mock.Mock()
+ 		non_tty_stdin.isatty.return_value =3D False
+ 		tree =3D kunit_kernel.LinuxSourceTree('', kunitconfig_paths=3D[os.devnu=
ll])
+=20
+ 		with mock.patch.object(kunit_kernel.sys, 'stdin', non_tty_stdin), \
+ 		     mock.patch.object(kunit_kernel.subprocess, 'call') as mock_call, \
+ 		     mock.patch.object(kunit_kernel.logging, 'error') as mock_error:
+ 			tree.signal_handler(signal.SIGINT, None)
+ 			mock_error.assert_called_once()
+ 			mock_call.assert_not_called()
+=20
+ 	def test_signal_handler_resets_terminal_with_tty(self):
+ 		tty_stdin =3D mock.Mock()
+ 		tty_stdin.isatty.return_value =3D True
+ 		tree =3D kunit_kernel.LinuxSourceTree('', kunitconfig_paths=3D[os.devnu=
ll])
+=20
+ 		with mock.patch.object(kunit_kernel.sys, 'stdin', tty_stdin), \
+ 		     mock.patch.object(kunit_kernel.subprocess, 'call') as mock_call, \
+ 		     mock.patch.object(kunit_kernel.logging, 'error') as mock_error:
+ 			tree.signal_handler(signal.SIGINT, None)
+ 			mock_error.assert_called_once()
+ 			mock_call.assert_called_once_with(['stty', 'sane'])
+=20
  	def test_build_reconfig_no_config(self):
  		with tempfile.TemporaryDirectory('') as build_dir:
  			with open(kunit_kernel.get_kunitconfig_path(build_dir), 'w') as f:

--hfNC1pDvprs7gibH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnM9JIACgkQJNaLcl1U
h9Awnwf+Oi3xM8TNwPeobG3zN2dm8oB5WUgQo5H472PmaMiJWXR6LYADrwc1PT9/
oKQPhJ0KLjvkpdJYY2JvKxj42dTuKEpyyt4JTPNVjgsiEfe88lU8PAncbA1ljExS
Rc3UYLi8x6VTXHnHXImZGia8xScJfNdQtkVFAoj/cfIUmrjbXkRGD3MRVmmigJV9
SzfQBr6Gzv4fqv6HwacBLUMVcluH6YyiHycpvUZvex67+TCwiEnb5gsw4mDA0Nyy
oBGvrBjlhsqdJLCH8BhN+9U2aV58vH8F7fP0EhKuTRRjRnAV6ykJeGPZWktqcIk9
cUDanQmfW2+RAwQUqeyiGHykVVW48g==
=pTYb
-----END PGP SIGNATURE-----

--hfNC1pDvprs7gibH--
