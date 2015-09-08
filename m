From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
Date: Tue, 8 Sep 2015 11:24:33 +0200
Message-ID: <55EEA951.6020604@redhat.com>
References: <20150908113544.41d5a451@canb.auug.org.au>
 <BLU436-SMTP381CF188008388F4CA601D80530@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60058 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752020AbbIHJYh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Sep 2015 05:24:37 -0400
In-Reply-To: <BLU436-SMTP381CF188008388F4CA601D80530@phx.gbl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wanpeng Li <wanpeng.li@hotmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org



On 08/09/2015 04:10, Wanpeng Li wrote:
> 
> I miss place the trace codes under CONFIG_KVM_ASYNC_PF, the patch in the
> attachment rewrite the commit and fix it. Sorry for that.

Thanks.  I cannot rewind kvm/next, so I committed just the incremental change:

diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 0d1bc478833b..d6f83222a6a1 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -356,6 +356,8 @@ TRACE_EVENT(
 		  __entry->address)
 );
 
+#endif
+
 TRACE_EVENT(kvm_halt_poll_ns,
 	TP_PROTO(bool grow, unsigned int vcpu_id, int new, int old),
 	TP_ARGS(grow, vcpu_id, new, old),
@@ -386,8 +388,6 @@ TRACE_EVENT(kvm_halt_poll_ns,
 #define trace_kvm_halt_poll_ns_shrink(vcpu_id, new, old) \
 	trace_kvm_halt_poll_ns(false, vcpu_id, new, old)
 
-#endif
-
 #endif /* _TRACE_KVM_MAIN_H */
 
 /* This part must be outside protection */

Paolo
