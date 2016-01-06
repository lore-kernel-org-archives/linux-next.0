From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kbuild
 tree
Date: Wed, 6 Jan 2016 17:54:23 +1100
Message-ID: <20160106175423.07e00c12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49796 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbcAFGyZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 6 Jan 2016 01:54:25 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  scripts/tags.sh

between commit:

  93209d65c1d3 ("tags: Unify emacs and exuberant rules")

from the kbuild tree and commit:

  ef0e95208c33 ("page-flags: drop __TestClearPage*() helpers")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc scripts/tags.sh
index bcc1d8cb142b,76f131ebc192..000000000000
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@@ -145,108 -150,8 +145,107 @@@ dogtags(
  	all_target_sources | gtags -i -f -
  }
  
 +# Basic regular expressions with an optional /kind-spec/ for ctags and
 +# the following limitations:
 +# - No regex modifiers
 +# - Use \{0,1\} instead of \?, because etags expects an unescaped ?
 +# - \s is not working with etags, use a space or [ \t]
 +# - \w works, but does not match underscores in etags
 +# - etags regular expressions have to match at the start of a line;
 +#   a ^[^#] is prepended by setup_regex unless an anchor is already present
 +regex_asm=(
 +	'/^\(ENTRY\|_GLOBAL\)(\([[:alnum:]_\\]*\)).*/\2/'
 +)
 +regex_c=(
 +	'/^SYSCALL_DEFINE[0-9](\([[:alnum:]_]*\).*/sys_\1/'
 +	'/^COMPAT_SYSCALL_DEFINE[0-9](\([[:alnum:]_]*\).*/compat_sys_\1/'
 +	'/^TRACE_EVENT(\([[:alnum:]_]*\).*/trace_\1/'
 +	'/^TRACE_EVENT(\([[:alnum:]_]*\).*/trace_\1_rcuidle/'
 +	'/^DEFINE_EVENT([^,)]*, *\([[:alnum:]_]*\).*/trace_\1/'
 +	'/^DEFINE_EVENT([^,)]*, *\([[:alnum:]_]*\).*/trace_\1_rcuidle/'
 +	'/^PAGEFLAG(\([[:alnum:]_]*\).*/Page\1/'
 +	'/^PAGEFLAG(\([[:alnum:]_]*\).*/SetPage\1/'
 +	'/^PAGEFLAG(\([[:alnum:]_]*\).*/ClearPage\1/'
 +	'/^TESTSETFLAG(\([[:alnum:]_]*\).*/TestSetPage\1/'
 +	'/^TESTPAGEFLAG(\([[:alnum:]_]*\).*/Page\1/'
 +	'/^SETPAGEFLAG(\([[:alnum:]_]*\).*/SetPage\1/'
 +	'/\<__SETPAGEFLAG(\([[:alnum:]_]*\).*/__SetPage\1/'
 +	'/\<TESTCLEARFLAG(\([[:alnum:]_]*\).*/TestClearPage\1/'
 +	'/\<__TESTCLEARFLAG(\([[:alnum:]_]*\).*/TestClearPage\1/'
 +	'/\<CLEARPAGEFLAG(\([[:alnum:]_]*\).*/ClearPage\1/'
 +	'/\<__CLEARPAGEFLAG(\([[:alnum:]_]*\).*/__ClearPage\1/'
 +	'/^__PAGEFLAG(\([[:alnum:]_]*\).*/__SetPage\1/'
 +	'/^__PAGEFLAG(\([[:alnum:]_]*\).*/__ClearPage\1/'
 +	'/^PAGEFLAG_FALSE(\([[:alnum:]_]*\).*/Page\1/'
 +	'/\<TESTSCFLAG(\([[:alnum:]_]*\).*/TestSetPage\1/'
 +	'/\<TESTSCFLAG(\([[:alnum:]_]*\).*/TestClearPage\1/'
 +	'/\<SETPAGEFLAG_NOOP(\([[:alnum:]_]*\).*/SetPage\1/'
 +	'/\<CLEARPAGEFLAG_NOOP(\([[:alnum:]_]*\).*/ClearPage\1/'
 +	'/\<__CLEARPAGEFLAG_NOOP(\([[:alnum:]_]*\).*/__ClearPage\1/'
 +	'/\<TESTCLEARFLAG_FALSE(\([[:alnum:]_]*\).*/TestClearPage\1/'
- 	'/\<__TESTCLEARFLAG_FALSE(\([[:alnum:]_]*\).*/__TestClearPage\1/'
 +	'/^TASK_PFA_TEST([^,]*, *\([[:alnum:]_]*\))/task_\1/'
 +	'/^TASK_PFA_SET([^,]*, *\([[:alnum:]_]*\))/task_set_\1/'
 +	'/^TASK_PFA_CLEAR([^,]*, *\([[:alnum:]_]*\))/task_clear_\1/'
 +	'/^DEF_MMIO_\(IN\|OUT\)_[XD](\([[:alnum:]_]*\),[^)]*)/\2/'
 +	'/^DEBUGGER_BOILERPLATE(\([[:alnum:]_]*\))/\1/'
 +	'/^DEF_PCI_AC_\(\|NO\)RET(\([[:alnum:]_]*\).*/\2/'
 +	'/^PCI_OP_READ(\(\w*\).*[1-4])/pci_bus_read_config_\1/'
 +	'/^PCI_OP_WRITE(\(\w*\).*[1-4])/pci_bus_write_config_\1/'
 +	'/\<DEFINE_\(MUTEX\|SEMAPHORE\|SPINLOCK\)(\([[:alnum:]_]*\)/\2/v/'
 +	'/\<DEFINE_\(RAW_SPINLOCK\|RWLOCK\|SEQLOCK\)(\([[:alnum:]_]*\)/\2/v/'
 +	'/\<DECLARE_\(RWSEM\|COMPLETION\)(\([[:alnum:]_]\+\)/\2/v/'
 +	'/\<DECLARE_BITMAP(\([[:alnum:]_]*\)/\1/v/'
 +	'/\(^\|\s\)\(\|L\|H\)LIST_HEAD(\([[:alnum:]_]*\)/\3/v/'
 +	'/\(^\|\s\)RADIX_TREE(\([[:alnum:]_]*\)/\2/v/'
 +	'/\<DEFINE_PER_CPU([^,]*, *\([[:alnum:]_]*\)/\1/v/'
 +	'/\<DEFINE_PER_CPU_SHARED_ALIGNED([^,]*, *\([[:alnum:]_]*\)/\1/v/'
 +	'/\<DECLARE_WAIT_QUEUE_HEAD(\([[:alnum:]_]*\)/\1/v/'
 +	'/\<DECLARE_\(TASKLET\|WORK\|DELAYED_WORK\)(\([[:alnum:]_]*\)/\2/v/'
 +	'/\<DEFINE_PCI_DEVICE_TABLE(\([[:alnum:]_]*\)/\1/v/'
 +	'/\(^\s\)OFFSET(\([[:alnum:]_]*\)/\2/v/'
 +	'/\(^\s\)DEFINE(\([[:alnum:]_]*\)/\2/v/'
 +	'/\<DEFINE_HASHTABLE(\([[:alnum:]_]*\)/\1/v/'
 +)
 +regex_kconfig=(
 +	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\+\([[:alnum:]_]\+\)/\2/'
 +	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\+\([[:alnum:]_]\+\)/CONFIG_\2/'
 +)
 +setup_regex()
 +{
 +	local mode=$1 lang tmp=() r
 +	shift
 +
 +	regex=()
 +	for lang; do
 +		case "$lang" in
 +		asm)       tmp=("${regex_asm[@]}") ;;
 +		c)         tmp=("${regex_c[@]}") ;;
 +		kconfig)   tmp=("${regex_kconfig[@]}") ;;
 +		esac
 +		for r in "${tmp[@]}"; do
 +			if test "$mode" = "exuberant"; then
 +				regex[${#regex[@]}]="--regex-$lang=${r}b"
 +			else
 +				# Remove ctags /kind-spec/
 +				case "$r" in
 +				/*/*/?/)
 +					r=${r%?/}
 +				esac
 +				# Prepend ^[^#] unless already anchored
 +				case "$r" in
 +				/^*) ;;
 +				*)
 +					r="/^[^#]*${r#/}"
 +				esac
 +				regex[${#regex[@]}]="--regex=$r"
 +			fi
 +		done
 +	done
 +}
 +
  exuberant()
  {
 +	setup_regex exuberant asm c
  	all_target_sources | xargs $1 -a                        \
  	-I __initdata,__exitdata,__initconst,			\
  	-I __initdata_memblock					\
