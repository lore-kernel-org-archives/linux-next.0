From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the bpf tree
Date: Thu, 7 Dec 2017 11:00:01 +1100
Message-ID: <20171207110001.4c3342b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Hi Al,

Today's linux-next merge of the vfs tree got conflicts in:

  arch/alpha/include/uapi/asm/Kbuild
  arch/mn10300/include/uapi/asm/Kbuild
  arch/score/include/uapi/asm/Kbuild

between commit:

  c895f6f703ad ("bpf: correct broken uapi for BPF_PROG_TYPE_PERF_EVENT program type")

from the bpf tree and commit:

  d759be8953fe ("switch wrapper poll.h instances to generic-y")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I do wonder if those poll.h additions are necessary given that poll.h
is listed in include/uapi/asm-generic/Kbuild.asm ...

-- 
Cheers,
Stephen Rothwell

diff --cc arch/alpha/include/uapi/asm/Kbuild
index 14a2e9af97e9,574fe90c8b58..000000000000
--- a/arch/alpha/include/uapi/asm/Kbuild
+++ b/arch/alpha/include/uapi/asm/Kbuild
@@@ -1,4 -1,4 +1,5 @@@
  # UAPI Header export list
  include include/uapi/asm-generic/Kbuild.asm
  
 +generic-y += bpf_perf_event.h
+ generic-y += poll.h
diff --cc arch/mn10300/include/uapi/asm/Kbuild
index 81271d3af47c,162fbdbb5fd5..000000000000
--- a/arch/mn10300/include/uapi/asm/Kbuild
+++ b/arch/mn10300/include/uapi/asm/Kbuild
@@@ -1,5 -1,5 +1,6 @@@
  # UAPI Header export list
  include include/uapi/asm-generic/Kbuild.asm
  
 +generic-y	+= bpf_perf_event.h
+ generic-y	+= poll.h
  generic-y	+= siginfo.h
diff --cc arch/score/include/uapi/asm/Kbuild
index 81271d3af47c,162fbdbb5fd5..000000000000
--- a/arch/score/include/uapi/asm/Kbuild
+++ b/arch/score/include/uapi/asm/Kbuild
@@@ -1,5 -1,5 +1,6 @@@
  # UAPI Header export list
  include include/uapi/asm-generic/Kbuild.asm
  
 +generic-y	+= bpf_perf_event.h
+ generic-y	+= poll.h
  generic-y	+= siginfo.h
