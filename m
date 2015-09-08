From: Wanpeng Li <wanpeng.li@hotmail.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
Date: Tue, 8 Sep 2015 10:10:13 +0800
Message-ID: <BLU436-SMTP381CF188008388F4CA601D80530@phx.gbl>
References: <20150908113544.41d5a451@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------040705000300050407070708"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150908113544.41d5a451@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
List-Id: linux-next.vger.kernel.org

--------------040705000300050407070708
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paolo, Stephen,
On 9/8/15 9:35 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the kvm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'grow_halt_poll_ns':
> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1931:2: error: implicit declaration of function 'trace_kvm_halt_poll_ns_grow' [-Werror=implicit-function-declaration]
>    trace_kvm_halt_poll_ns_grow(vcpu->vcpu_id, val, old);
>    ^
> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c: In function 'shrink_halt_poll_ns':
> arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:1945:2: error: implicit declaration of function 'trace_kvm_halt_poll_ns_shrink' [-Werror=implicit-function-declaration]
>    trace_kvm_halt_poll_ns_shrink(vcpu->vcpu_id, val, old);
>    ^
>
> Caused by commit
>
>    2cbd78244fb2 ("KVM: trace kvm_halt_poll_ns grow/shrink")
>
> I have reverted that commit for today.

I miss place the trace codes under CONFIG_KVM_ASYNC_PF, the patch in the 
attachment rewrite the commit and fix it. Sorry for that.

Regards,
Wanpeng Li

--------------040705000300050407070708
Content-Type: text/plain; charset="UTF-8"; x-mac-type=0; x-mac-creator=0;
	name="0001-KVM-trace-kvm_halt_poll_ns-grow-shrink.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-KVM-trace-kvm_halt_poll_ns-grow-shrink.patch"

>From c06ca8fec43a7ccc1fe265afe8b2fd3b84085368 Mon Sep 17 00:00:00 2001
From: Wanpeng Li <wanpeng.li@hotmail.com>
Date: Tue, 8 Sep 2015 10:03:38 +0800
Subject: [PATCH] KVM: trace kvm_halt_poll_ns grow/shrink

Tracepoint for dynamic halt_pool_ns, fired on every potential change.

Signed-off-by: Wanpeng Li <wanpeng.li@hotmail.com>
---
 include/trace/events/kvm.h | 30 ++++++++++++++++++++++++++++++
 virt/kvm/kvm_main.c        |  8 ++++++--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index a44062d..d6f8322 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -358,6 +358,36 @@ TRACE_EVENT(
 
 #endif
 
+TRACE_EVENT(kvm_halt_poll_ns,
+	TP_PROTO(bool grow, unsigned int vcpu_id, int new, int old),
+	TP_ARGS(grow, vcpu_id, new, old),
+
+	TP_STRUCT__entry(
+		__field(bool, grow)
+		__field(unsigned int, vcpu_id)
+		__field(int, new)
+		__field(int, old)
+	),
+
+	TP_fast_assign(
+		__entry->grow           = grow;
+		__entry->vcpu_id        = vcpu_id;
+		__entry->new            = new;
+		__entry->old            = old;
+	),
+
+	TP_printk("vcpu %u: halt_poll_ns %d (%s %d)",
+			__entry->vcpu_id,
+			__entry->new,
+			__entry->grow ? "grow" : "shrink",
+			__entry->old)
+);
+
+#define trace_kvm_halt_poll_ns_grow(vcpu_id, new, old) \
+	trace_kvm_halt_poll_ns(true, vcpu_id, new, old)
+#define trace_kvm_halt_poll_ns_shrink(vcpu_id, new, old) \
+	trace_kvm_halt_poll_ns(false, vcpu_id, new, old)
+
 #endif /* _TRACE_KVM_MAIN_H */
 
 /* This part must be outside protection */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8ab49cf..4662a88 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1918,8 +1918,9 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_mark_page_dirty);
 
 static void grow_halt_poll_ns(struct kvm_vcpu *vcpu)
 {
-	int val = vcpu->halt_poll_ns;
+	int old, val;
 
+	old = val = vcpu->halt_poll_ns;
 	/* 10us base */
 	if (val == 0 && halt_poll_ns_grow)
 		val = 10000;
@@ -1927,18 +1928,21 @@ static void grow_halt_poll_ns(struct kvm_vcpu *vcpu)
 		val *= halt_poll_ns_grow;
 
 	vcpu->halt_poll_ns = val;
+	trace_kvm_halt_poll_ns_grow(vcpu->vcpu_id, val, old);
 }
 
 static void shrink_halt_poll_ns(struct kvm_vcpu *vcpu)
 {
-	int val = vcpu->halt_poll_ns;
+	int old, val;
 
+	old = val = vcpu->halt_poll_ns;
 	if (halt_poll_ns_shrink == 0)
 		val = 0;
 	else
 		val /= halt_poll_ns_shrink;
 
 	vcpu->halt_poll_ns = val;
+	trace_kvm_halt_poll_ns_shrink(vcpu->vcpu_id, val, old);
 }
 
 static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
-- 
1.9.1


--------------040705000300050407070708--
