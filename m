Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4117A2FF66A;
	Fri, 31 Jul 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505818; cv=none; b=GifWw/MnEQ7MenLJtvAhWUny3DeQ2c/YgVCWELi0dFoBkfIvkPe7h5XKDnVnuGRGhCZck2/ObOSnJQmeI4r5dCe5S7CLPtRDYheGA3T2mv0S6c65RpBkREVqr43YW1WTTL+xVzgOjWYSOLFA7qP2+eE40QILRBIrCDWDOhCbri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505818; c=relaxed/simple;
	bh=lIXaGQ8GLg33OT/V8PY9isC9CADs4z/l1190ldKsagk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuLP82c0XL+VDFfTSW5d6Q/nFg8Hh+b+ELrsEmIAjjbKFDDsWANyvy09iBKb7fD7gDiCUeb8GcYlAPBg5IaM1PmnvTt60lsucvzn6pY2Qn03p4TpciqmamNSmigHvUYmXNL3lW0YUjTTr0qMuH+ReotkJxvWbEgTS+y5DI+WTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQlcUddI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQlcUddI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51681F000E9;
	Fri, 31 Jul 2026 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785505816;
	bh=4L3ICYCTzvmlMAj07k+QricjCgeQKNXx/VXhBoLvOnc=;
	h=Date:From:To:Cc:Subject;
	b=LQlcUddIVVPj17zsFUNfCKWKwj4wL/WFkqmIfrgEVPnoTs9QY8wmQEld7Dn+nHihB
	 iZyobrTOv+747FP6JQ4f1RGNAC98/3vL5tydtRY+Yqhf8EEz8bQWsLtd1iis4568nw
	 4qB3rUqYgRqikgl4WgrwjXpVpWfzYcVtWimwsrYkZzmMqcOjxdFQB4j5GbwWzy034l
	 rFlbDEHO6I0g8Cs4DXsNxShDk0R0fasRNzmq83QIv/jgSoTPlhD702rnVV5zR7rgLB
	 NWobtCyR2UCL3b5MitZ1VB7JtYO01U0/tQ2T/pP480SKax5gVBaX8pjNX1Yt8DLY01
	 +J4fvLR9viNyw==
Date: Fri, 31 Jul 2026 14:50:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ntfs tree
Message-ID: <amyoFfMXA9fI2hbF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PWlF4IB82sc89s2M"
Content-Disposition: inline


--PWlF4IB82sc89s2M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the ntfs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/fs/ntfs/attrlist.c:183:6: error: variable 'new_al' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  183 |         if (!NInoAttrList(ni) || !ni->attr_list) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs/attrlist.c:317:6: note: uninitialized use occurs here
  317 |         if (new_al)
      |             ^~~~~~
/tmp/next/build/fs/ntfs/attrlist.c:183:2: note: remove the 'if' if its condition is always false
  183 |         if (!NInoAttrList(ni) || !ni->attr_list) {
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  184 |                 err = -ENOENT;
      |                 ~~~~~~~~~~~~~~
  185 |                 goto err_out;
      |                 ~~~~~~~~~~~~~
  186 |         }
      |         ~
/tmp/next/build/fs/ntfs/attrlist.c:183:6: error: variable 'new_al' is used uninitialized whenever '||' condition is true [-Werror,-Wsometimes-uninitialized]
  183 |         if (!NInoAttrList(ni) || !ni->attr_list) {
      |             ^~~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs/attrlist.c:317:6: note: uninitialized use occurs here
  317 |         if (new_al)
      |             ^~~~~~
/tmp/next/build/fs/ntfs/attrlist.c:183:6: note: remove the '||' if its condition is always false
  183 |         if (!NInoAttrList(ni) || !ni->attr_list) {
      |             ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/fs/ntfs/attrlist.c:149:12: note: initialize the variable 'new_al' to silence this warning
  149 |         u8 *new_al;
      |                   ^
      |                    = NULL
2 errors generated.

Caused by commit

  57ad655524e85 (ntfs: protect attribute-list buffer replacement with attr_list_persist_lock)

I have used the tree from next-20260730 instead.

--PWlF4IB82sc89s2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpsqBQACgkQJNaLcl1U
h9CUsgf8C+X4C+8ktdwgJmji8z5Zy+BwdkObAYfi/Doh+J+h2xPcaVUrw+GR/9fc
GtcwGikjrFhov0Ft7mo7lK5hbhUWTQHWrSzP8lj/BdD5GzbFou2jWTFH8vXUI5n9
yuZRUrU+rar7iOkreYHf6IjiVEx02vxVcV0+2sZnytXGuVesRO5MAXz2ex8pYliB
33W2HzQ1/f+ElZMIRBMn3cBmkU7tmG3axhzF5u2UL4Zxp39w6jcitcMUCyoM/g/1
YTYimSOQbrk6qOKA5+q95sK7iWFjBAL7k5nwzWYI+sJoMQcpe3hMGkD8qZL1ijIs
b8/Hw3lDmD+VttldczDDzKztTPA2hg==
=Cubg
-----END PGP SIGNATURE-----

--PWlF4IB82sc89s2M--
