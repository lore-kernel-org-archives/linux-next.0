From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] KVM: x86: Use do_div for tsc deadline calculation
Date: Fri, 30 Sep 2011 13:50:20 +0200
Message-ID: <4E85ACFC.1090509@siemens.com>
References: <20110929165730.661cf28c9bb27b8a85432cd2@canb.auug.org.au> <4E84CC00.8090702@xenotime.net> <20110930085810.11bc8e2e38e1400a8b0b4cec@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110930085810.11bc8e2e38e1400a8b0b4cec@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Liu >> \"Liu, Jinsong\"" <jinsong.liu@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>
List-Id: linux-next.vger.kernel.org

Required on i386 hosts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 arch/x86/kvm/lapic.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index f9385ec..92390dc 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -740,9 +740,10 @@ static void start_apic_timer(struct kvm_lapic *apic)
 
 		now = apic->lapic_timer.timer.base->get_time();
 		guest_tsc = kvm_x86_ops->read_l1_tsc(vcpu);
-		if (likely(tscdeadline > guest_tsc))
-			ns = (tscdeadline - guest_tsc)
-				* 1000000L / this_tsc_khz;
+		if (likely(tscdeadline > guest_tsc)) {
+			ns = (tscdeadline - guest_tsc) * 1000000ULL;
+			do_div(ns, this_tsc_khz);
+		}
 		hrtimer_start(&apic->lapic_timer.timer,
 			ktime_add_ns(now, ns), HRTIMER_MODE_ABS);
 
-- 
1.7.3.4
