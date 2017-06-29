From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kselftest tree
Date: Thu, 29 Jun 2017 12:35:27 -0700
Message-ID: <20170629123527.2196820e70818aeab51338e5@linux-foundation.org>
References: <20170628183111.05680b34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170628183111.05680b34@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shuah Khan <shuahkh@osg.samsung.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Orson Zhai <orson.zhai@linaro.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 28 Jun 2017 18:31:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got conflicts in:
> 
>   tools/testing/selftests/sysctl/common_tests
>   tools/testing/selftests/sysctl/run_numerictests
>   tools/testing/selftests/sysctl/run_stringtests
> 
> between commit:
> 
>   d644437a1dc6 ("tools/testing/selftests/sysctl: Add pre-check to the value of writes_strict")
> 
> from the kselftest tree and commit:
> 
>   fed7038685f3 ("test_sysctl: add generic script to expand on tests")
> 
> from the akpm-current tree.
> 
> I fixed it up (I removed the files and so, for now I have effectively
> dropped the kselftest tree patch) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

urgh.

I'll drop 

test_sysctl-add-dedicated-proc-sysctl-test-driver.patch
test_sysctl-add-generic-script-to-expand-on-tests.patch
test_sysctl-test-against-page_size-for-int.patch
test_sysctl-add-simple-proc_dointvec-case.patch
test_sysctl-add-simple-proc_douintvec-case.patch
test_sysctl-test-against-int-proc_dointvec-array-support.patch

Luis, could you please redo these against the changes in linux-next and
resend?

Thanks.
