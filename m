From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: i7core_edac tree build failure
Date: Thu, 12 Nov 2009 23:40:25 +1030
Message-ID: <200911122340.26317.rusty@rustcorp.com.au>
References: <20091112165852.855d1e5d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:40362 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751552AbZKLNKZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2009 08:10:25 -0500
In-Reply-To: <20091112165852.855d1e5d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aristeu Rozanski <aris@redhat.com>

On Thu, 12 Nov 2009 04:28:52 pm Stephen Rothwell wrote:
> Hi Mauro,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> tmp_exports-asm.o: In function `__ksymtab_pci_legacy_init':
> (__ksymtab_gpl_sorted+0x3120): undefined reference to `pci_legacy_init'
> 
> Caused by commit a120a84ebbc4cbc9c1addddd2b491e3683b842a6 ("pci: Add a
> probing code that seeks for an specific bus") (which applies
> EXPORT_SYMBOL_GPL() to a static function) interacting with the rr tree's
> changes.

Yep, thanks Stephen.  I can't apply this fix to my tree since that function
isn't exported in Linus' tree.  I've pulled in the ppc and sparc fixes to my
tree though, but assume they'll go into their proper homes soon.

Thanks,
Rusty.
