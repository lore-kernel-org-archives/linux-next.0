From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Tue, 7 Mar 2017 14:07:35 +1100
Message-ID: <20170307140735.03597b4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57961 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754828AbdCGDJ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Mar 2017 22:09:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laura Abbott <labbott@redhat.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/clnt.h:27,
                 from include/linux/nfs_fs.h:30,
                 from init/do_mounts.c:32:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from arch/powerpc/net/bpf_jit_comp64.c:17:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from ipc/mqueue.c:42:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
kernel/module.c:52:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/clnt.h:27,
                 from include/linux/nfs_fs.h:30,
                 from kernel/sysctl.c:54:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/extable.c:25:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from kernel/cgroup/cgroup.c:57:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/bpf/inode.c:22:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/kallsyms.c:26:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/events/core.c:46:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/bpf/core.c:24:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/bpf/hashtab.c:15:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/linux/bpf_verifier.h:11:0,
                 from kernel/bpf/verifier.c:17:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/bpf/stackmap.c:9:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/seccomp.c:31:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/trace/events/bpf.h:7:0,
                 from include/linux/bpf_trace.h:4,
                 from kernel/bpf/syscall.c:13:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/net/inet_sock.h:27,
                 from include/net/ip.h:30,
                 from include/net/busy_poll.h:30,
                 from fs/select.c:31:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/bpf/helpers.c:20:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from kernel/bpf/cgroup.c:17:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from kernel/bpf/lpm_trie.c:17:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/bpf/arraymap.c:16:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from kernel/trace/bpf_trace.c:13:0:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/if_pppox.h:46,
                 from fs/compat_ioctl.c:38:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from fs/cifs/cifsfs.c:41:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/clnt.h:27,
                 from include/linux/nfs_fs.h:30,
                 from fs/lockd/clntlock.c:13:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/clnt.h:27,
                 from include/linux/nfs_fs.h:30,
                 from fs/lockd/clntproc.c:14:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from fs/cifs/cifspdu.h:25,
                 from fs/cifs/cifssmb.c:39:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from fs/cifs/cifspdu.h:25,
                 from fs/cifs/cifs_debug.c:28:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from fs/cifs/connect.c:43:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/addr.h:13,
                 from fs/nfs/client.c:23:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/lockd/lockd.h:16,
                 from fs/nfsd/nfsctl.c:12:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/if_inet6.h:19,
                 from include/net/addrconf.h:51,
                 from fs/nfsd/nfssvc.c:22:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/clnt.h:27,
                 from include/linux/nfs_fs.h:30,
                 from fs/nfs/file.c:25:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/clnt.h:27,
                 from fs/nfs/dir.c:29:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory
In file included from include/net/sock.h:64:0,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:83,
                 from include/net/ipv6.h:16,
                 from include/linux/sunrpc/addr.h:13,
                 from fs/nfsd/nfscache.c:13:
include/linux/filter.h:21:28: fatal error: asm/set_memory.h: No such file or directory

Caused by patches

  include/linux/filter.h: use set_memory.h header
  module: use set_memory.h header

I think this series is not really ready yet :-(

I removed patches:

treewide-move-set_memory_-functions-away-from-cacheflushh.patch
treewide-move-set_memory_-functions-away-from-cacheflushh-fix.patch
arm-use-set_memoryh-header.patch
arm64-use-set_memoryh-header.patch
arm64-use-set_memoryh-header-fix.patch
s390-use-set_memoryh-header.patch
x86-use-set_memoryh-header.patch
agp-use-set_memoryh-header.patch
drm-use-set_memoryh-header.patch
intel_th-use-set_memoryh-header.patch
watchdog-hpwdt-use-set_memoryh-header.patch
#bpf-use-set_memoryh-header.patch: robot error
bpf-use-set_memoryh-header.patch
module-use-set_memoryh-header.patch
pm-hibernate-use-set_memoryh-header.patch
alsa-hda-use-set_memoryh-header.patch
#treewide-decouple-cacheflushh-and-set_memoryh.patch: robot errors
treewide-decouple-cacheflushh-and-set_memoryh.patch
treewide-decouple-cacheflushh-and-set_memoryh-fix.patch
treewide-decouple-cacheflushh-and-set_memoryh-fix-fix.patch
treewide-decouple-cacheflushh-and-set_memoryh-fix-fix-fix.patch
treewide-decouple-cacheflushh-and-set_memoryh-fix-fix-fix-fix.patch
treewide-decouple-cacheflushh-and-set_memoryh-fix-fix-fix-fix-fix.patch
treewide-decouple-cacheflushh-and-set_memoryh-fix-fix-fix-fix-fix-fix.patch

from the akpm tree (as well as the other 2 fixes I posted) for today.

-- 
Cheers,
Stephen Rothwell
