From: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree (kvm-ppc
 tree related)
Date: Thu, 19 Apr 2012 22:14:13 -0300
Message-ID: <20120420011413.GA12235@amt.cnet>
References: <20120419163535.52c99a34e2664063d654ac4d@canb.auug.org.au>
 <20120420101012.591b5e64a8939135bf5cd167@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120420101012.591b5e64a8939135bf5cd167@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric B Munson <emunson@mgebm.net>, Alexander Graf <agraf@suse.de>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 20, 2012 at 10:10:12AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 19 Apr 2012 16:35:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the final tree, today's linux-next build (sparc64 defconfig)
> > failed like this:
> > 
> > In file included from kernel/watchdog.c:27:0:
> > include/linux/kvm_para.h: In function 'kvm_para_has_feature':
> > include/linux/kvm_para.h:32:2: error: implicit declaration of function 'kvm_arch_para_features' [-Werror=implicit-function-declaration]
> > 
> > Caused by commit 5d1c0f4a80a6 ("watchdog: add check for suspended vm in
> > softlockup detector").  This build has no KVM related CONFIG options set.
> > 
> > I have reverted that commit for today.
> 
> This build failure now belongs to the kvm tree ...
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au


Stephen,

Can you try the patch below please?



KVM: add kvm_arch_para_features stub to asm-generic/kvm_para.h

Needed by kvm_para_has_feature().

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/include/asm-generic/kvm_para.h b/include/asm-generic/kvm_para.h
index 05ef7e7..9a7bbad 100644
--- a/include/asm-generic/kvm_para.h
+++ b/include/asm-generic/kvm_para.h
@@ -11,4 +11,9 @@ static inline bool kvm_check_and_clear_guest_paused(void)
 	return false;
 }
 
+static inline unsigned int kvm_arch_para_features(void)
+{
+	return 0;
+}
+
 #endif
