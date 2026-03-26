Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA837BE7E;
	Thu, 26 Mar 2026 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541068; cv=none; b=W5NspkNLw3I4MmINgh/WS/simeWp12a2pXO8DigJHVyqWKJEUBl+oti/+UyZik4Z/2gEDCoZp1Hcu9V3+DRu4V6vdcsO83oDYB4UYoo4eXIiVmOzz9r+9RD9ZFQl5HW5fIeHbPiX0GCFOJgL0fA+Wl8UoZlyt0KG8IhBT08QX9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541068; c=relaxed/simple;
	bh=mhzDJjtnWbeRqiBSmrSbxwEBFY2YnE9bEA8IwopVG0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l94GAt7q/4ojcxJH+N2ZtUtbw7V8dQz+p8YQ+Wy9wnuQiswsBINalIODT4mBNBUJ2StCeUF6cMMvtKDPSPIr3+Mee1KSGRrplCsbZjhw8iHVYWHqumMyOyqEHoyHZL+1OlLErK+QhmLyXMH89U4HJKo6UrYBf/6N6BjtS2EeR+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgqG1Mqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgqG1Mqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6338C116C6;
	Thu, 26 Mar 2026 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774541068;
	bh=mhzDJjtnWbeRqiBSmrSbxwEBFY2YnE9bEA8IwopVG0M=;
	h=Date:From:To:Cc:Subject:From;
	b=MgqG1MqtlbEkYaWnlKBoc0CFERhrnH5mzVNJkhuNSVqkyjzemblHOFKO7uddIFJL6
	 GVHI/IfJvARyvs3IVfuBnf5HucnCel1C5O0UKH4CyNd+eCpxK0FfAaPMKrjAW+ezTO
	 QC4M1l8yU9TOOs/MIBe4zsXSQnv4HlCnTZCVQ5E7QsxPgCb7bSJRmKi7qwV+VGE367
	 8ib3L5xBk7MBC4FOgEf+zw8cnhtmxS+8qw/THXJbxT9aOS6RIjkZc9B+8bfJcfGY18
	 a+ySOb2bL9ndW1Mja0qzQTi8baUQMOnzdHwkfm/B4+ffl7kDEpYSoCkbzhTrSZEruU
	 REqFrtoL6Jmiw==
Date: Thu, 26 Mar 2026 16:04:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Janne Grunau <j@jananu.net>, Danilo Krummrich <dakr@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in final build
Message-ID: <acVZB6iMoUrV45zH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9yt+LFmTTuB4vkFf"
Content-Disposition: inline


--9yt+LFmTTuB4vkFf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

During the final builds, today's linux-next build (arm64 allyesconfig)
failed like this:

error[E0405]: cannot find trait `AlwaysRefCounted` in module
`$crate::types`
   --> /tmp/next/build/rust/kernel/drm/gem/mod.rs:42:62
    |
42 | unsafe impl $( <$( $tparam_id ),+> )? $crate::types::AlwaysRefCounted
for $type
    |                                                              ^^^^^^^^^^^^^^^^
    |                                                              not
    |                                                              found in
    |                                                              `$crate::types`
...  308 | impl_aref_for_gem_obj!(impl<T> for Object<T> where T:
DriverObject);
    | -------------------------------------------------------------------
    | in this macro invocation
    |
    = note: this error originates in the macro `impl_aref_for_gem_obj` (in Nightly builds, run with -Z macro-backtrace for more info)
help: consider importing this trait
    |
7 + use crate::sync::aref::AlwaysRefCounted;
    |

error[E0277]: the trait bound `Object<T>: aref::AlwaysRefCounted` is
not satisfied
   --> /tmp/next/build/rust/kernel/drm/gem/mod.rs:142:41
    |
142 | impl<T: DriverObject> IntoGEMObject for Object<T> {
    |                                         ^^^^^^^^^ the trait
    |                                         `aref::AlwaysRefCounted`
    |                                         is not implemented for
    |                                         `Object<T>`
    |
    = help: the following other types implement trait `aref::AlwaysRefCounted`:
              Chip<T>
              Credential
              FwNode
              I2cAdapter
              I2cClient
              Interface
              LocalFile
              Mm
            and 12 others
note: required by a bound in `IntoGEMObject`
   --> /tmp/next/build/rust/kernel/drm/gem/mod.rs:96:59
    |
96 | pub trait IntoGEMObject: Sized + super::private::Sealed +
AlwaysRefCounted {
    |                                                           ^^^^^^^^^^^^^^^^
    |                                                           required
    |                                                           by this
    |                                                           bound in
    |                                                           `IntoGEMObject`

error[E0277]: the trait bound `Object<T>: aref::AlwaysRefCounted` is
not satisfied
   --> /tmp/next/build/rust/kernel/drm/gem/mod.rs:320:37
    |
320 | impl<T: DriverObject> AllocImpl for Object<T> {
    |                                     ^^^^^^^^^ the trait
    |                                     `aref::AlwaysRefCounted` is
    |                                     not implemented for `Object<T>`
    |
    = help: the following other types implement trait `aref::AlwaysRefCounted`:
              Chip<T>
              Credential
              FwNode
              I2cAdapter
              I2cClient
              Interface
              LocalFile
              Mm
            and 12 others
note: required for `Object<T>` to implement `IntoGEMObject`
   --> /tmp/next/build/rust/kernel/drm/gem/mod.rs:96:11
    |
96 | pub trait IntoGEMObject: Sized + super::private::Sealed +
AlwaysRefCounted {
    |           ^^^^^^^^^^^^^
note: required by a bound in `AllocImpl`
   --> /tmp/next/build/rust/kernel/drm/driver.rs:90:47
    |
90 | pub trait AllocImpl: super::private::Sealed + drm::gem::IntoGEMObject
{
    |                                               ^^^^^^^^^^^^^^^^^^^^^^^
    |                                               required by this
    |                                               bound in `AllocImpl`

error: aborting due to 3 previous errors

Some errors have detailed explanations: E0277, E0405.  For more
information about an error, try `rustc --explain E0277`.

Presumably caused by one of these commits:

  442ba16a5a513 (rust: gem: Introduce DriverObject::Args)
  e64b9cc293ae7 (rust: drm: Add gem::impl_aref_for_gem_obj!)

I have ignored this for today.

--9yt+LFmTTuB4vkFf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnFWQcACgkQJNaLcl1U
h9B/dwf8CfiEhM9rMzVSbvhM9O0SMhUFzouz85mLz/+AhUVW3zZJl5J4yNRK3nJ1
8m89csp+O4zrfneiIrVkNsiCL0muU1M9OsdYFMWISfq2LHN1aJJbNtdgGwXVfijY
PadFKpN4djZ+616yWcMoMGYCIgtynkwrQtN4/Msjbpv7+DKSj13ZnfV7vosMC5fQ
b/dzm2hXQhV111zDmQB/R/OUZuZPg07w4YdagERUpbTMzpDhab14s5lHN2EQTQCI
I2My1lFFxL0bZIPGo6tFw2//5bjCpuQJb89m2sOibONpjyVuLtsg2t7bif7rnh01
cX3+OP/Kqwoqm/5hvD9ZXcNaHQfCeg==
=n2o5
-----END PGP SIGNATURE-----

--9yt+LFmTTuB4vkFf--
