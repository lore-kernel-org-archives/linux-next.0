From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: linux-next not booting on snowball
Date: Thu, 1 Dec 2011 14:58:01 +0000
Message-ID: <20111201145801.GB2103@sirena.org.uk>
References: <4ED79454.1090304@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ED79454.1090304-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Lists Linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 01, 2011 at 03:51:00PM +0100, Daniel Lezcano wrote:

> commit 549158d2ab01e8370d2773044fe09738a26f7086
> Author: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date:   Thu Aug 25 00:35:59 2011 -0400

>     ARM: move iotable mappings within the vmalloc region
>    
>     In order to remove the build time variation between different SOCs
> with
>     regards to VMALLOC_END, the iotable mappings are now allocated inside
>     the vmalloc region.  This allows for VMALLOC_END to be identical
> across
>     all machines.

I recently reported an issue with this patch on s3c64xx which I'm
avoiding with the below change, I believe Nicolas folded this in to his
code but it's not propagated into -next yet.

>From d53e2ce3fb18e097678b324932591044eb80c0f1 Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Date: Thu, 24 Nov 2011 12:46:04 +0000
Subject: [PATCH] ARM: Handle empty maps in iotable_init()

Some CPUs (such as the S3C6410) have been relying on being able to call
iotable_init() with no io_descs in order to simplify passing through
machine-specific io_descs. The changes in "ARM: move iotable mappings
within the vmalloc region" broke this by adding an early_alloc_aligned()
for an array of vm_structs. Fix this by returning early if no descriptors
have been passed.

I'm not sure if this is the most tasteful fix but it preserves existing
behaviour and allows boot to proceed on my system.

Signed-off-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 arch/arm/mm/mmu.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 06e2aef..94c5a0c 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -763,6 +763,9 @@ void __init iotable_init(struct map_desc *io_desc, int nr)
 	struct map_desc *md;
 	struct vm_struct *vm;
 
+	if (!nr)
+		return;
+
 	vm = early_alloc_aligned(sizeof(*vm) * nr, __alignof__(*vm));
 
 	for (md = io_desc; nr; md++, nr--) {
-- 
1.7.7.3
