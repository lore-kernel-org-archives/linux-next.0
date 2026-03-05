Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539AD30F808;
	Thu,  5 Mar 2026 19:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738646; cv=none; b=bIlzfonMlVNKuaSds1DWq8SKfwZ/zbJHi1b8lwyn0mBODyCwIhvBi6nh7MJMOs/gC1RoEg70IoU6w0xYXzoqxVyAKlpS41sxpe8T5taSmuaDtriSj6cFEFsJBbU4pQHbLBK1vsOJTpfR0zlvWFDoRao2z32xn14jwYfeSIUxKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738646; c=relaxed/simple;
	bh=ddbKvosUZwoCKDVoTASyzKX2QpqGgExreV1Uhpje9KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZXrJzh/FQp7vRmrb/993YYY2087iYRjNsf9vhMCsLtPLVAl90KR4W6ry/oksrcbrpWrB8I/+doNW2AlHgn6Nb47TFh8IJ+yXUvyRKxA7cN8uSvJ7FJqry2Jem83fZmgrbRxRY3xG3BYoKwNRkdh42Brh5Iq+67mXWyXoqSlIpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCMvCHRM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCMvCHRM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BE2C116C6;
	Thu,  5 Mar 2026 19:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772738646;
	bh=ddbKvosUZwoCKDVoTASyzKX2QpqGgExreV1Uhpje9KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NCMvCHRMkWbF0Y/Ai9FRmCVv6lCGDUJIXUdkiITLIb7xcoxCowgSaPXvAx0arpT8/
	 NOIpTIl+/4VYFLTn2ay/Vii9vQLiIJIGAMQdSfTppPnXP2F3IUCgbN72cGXnQLKgzA
	 NK1zueUc0AlmtE+ZKpMtNGKs3zyLZb7CTvkglwgwdvkj1MuXFiuSiCDBxTEbMKs7at
	 gE+L0A86s+Ezte026l7flSGrbZ9YqJ6hzsX4xt64jN0a8CYlPco6WAU1S5ss4RIrK6
	 WZMexE52EAh+wQ2FkjtbCgA5dC4bbYspkMI7v95VqAsHhJDW8Q6XlFgEm++szJnurh
	 ChUw1rVou2Erw==
Date: Thu, 5 Mar 2026 12:24:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sean Christopherson <seanjc@google.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20260305192401.GA1783111@ax162>
References: <aagjzN07Pv1fnSHq@sirena.org.uk>
 <aai71uI977FU6599@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aai71uI977FU6599@google.com>

On Wed, Mar 04, 2026 at 03:10:14PM -0800, Sean Christopherson wrote:
> On Wed, Mar 04, 2026, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the kvm-x86 tree got a conflict in:
> > 
> >   arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> > 
> > between commit:
> > 
> >   311214bf1df4b ("x86/virt/tdx: Retrieve TDX module version")
> > 
> > from the tip tree and commit:
> > 
> >   75b6c694eaed4 ("x86/virt/tdx: Tag a pile of functions as __init, and globals as __ro_after_init")
> > 
> > from the kvm-x86 tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> > index 4c9917a9c2c39,360963bc9328f..0000000000000
> > --- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> > +++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> > @@@ -7,22 -7,7 +7,22 @@@
> >    * Include this file to other C file instead.
> >    */
> >   
> >  +static int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_version)
> 
> Functionally this is a-ok, but we should remember to mention to Linus (and Paolo)
> that this can be marked __init when the two branches get smushed together.

s/can be/need to be/, I am seeing warnings from modpost as a result of
get_tdx_sys_info_version() lacking __init when building with clang:

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper allmodconfig all
  ...
  WARNING: modpost: vmlinux: section mismatch in reference: get_tdx_sys_info_version+0x3e (section: .text.unlikely.) -> read_sys_metadata_field (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: get_tdx_sys_info_version+0x90 (section: .text.unlikely.) -> read_sys_metadata_field (section: .init.text)
  WARNING: modpost: vmlinux: section mismatch in reference: get_tdx_sys_info_version+0xc0 (section: .text.unlikely.) -> read_sys_metadata_field (section: .init.text)

This obviously clears it. Mark, can that be applied to whichever merge
happens second?

Cheers,
Nathan

diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
index e854aa0ca649..c7db393a9cfb 100644
--- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
+++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
@@ -7,7 +7,7 @@
  * Include this file to other C file instead.
  */
 
-static int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_version)
+static __init int get_tdx_sys_info_version(struct tdx_sys_info_version *sysinfo_version)
 {
 	int ret = 0;
 	u64 val;
