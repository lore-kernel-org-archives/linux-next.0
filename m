From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kselftest tree
Date: Sat, 1 Jul 2017 00:43:26 +0200
Message-ID: <20170630224326.GW21846@wotan.suse.de>
References: <20170628183111.05680b34@canb.auug.org.au>
 <20170629123527.2196820e70818aeab51338e5@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57221 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753130AbdF3Wn3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jun 2017 18:43:29 -0400
Content-Disposition: inline
In-Reply-To: <20170629123527.2196820e70818aeab51338e5@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shuah Khan <shuahkh@osg.samsung.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Orson Zhai <orson.zhai@linaro.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>

On Thu, Jun 29, 2017 at 12:35:27PM -0700, Andrew Morton wrote:
> On Wed, 28 Jun 2017 18:31:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the akpm-current tree got conflicts in:
> > 
> >   tools/testing/selftests/sysctl/common_tests
> >   tools/testing/selftests/sysctl/run_numerictests
> >   tools/testing/selftests/sysctl/run_stringtests
> > 
> > between commit:
> > 
> >   d644437a1dc6 ("tools/testing/selftests/sysctl: Add pre-check to the value of writes_strict")
> > 
> > from the kselftest tree and commit:
> > 
> >   fed7038685f3 ("test_sysctl: add generic script to expand on tests")
> > 
> > from the akpm-current tree.
> > 
> > I fixed it up (I removed the files and so, for now I have effectively
> > dropped the kselftest tree patch) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> 
> urgh.
> 
> I'll drop 
> 
> test_sysctl-add-dedicated-proc-sysctl-test-driver.patch
> test_sysctl-add-generic-script-to-expand-on-tests.patch
> test_sysctl-test-against-page_size-for-int.patch
> test_sysctl-add-simple-proc_dointvec-case.patch
> test_sysctl-add-simple-proc_douintvec-case.patch
> test_sysctl-test-against-int-proc_dointvec-array-support.patch
> 
> Luis, could you please redo these against the changes in linux-next and
> resend?

Coming right up!

  Luis
