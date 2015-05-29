From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
Date: Fri, 29 May 2015 14:08:41 +0200
Message-ID: <556856C9.7040102@redhat.com>
References: <20150529173648.61bf6592@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150529173648.61bf6592@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256



On 29/05/2015 09:36, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm tree, today's linux-next build (x86_64 
> allmodconfig) failed like this:
> 
> arch/x86/kvm/cpuid.c: In function 'kvm_update_cpuid': 
> arch/x86/kvm/cpuid.c:98:2: error: implicit declaration of function 
> 'use_eager_fpu' [-Werror=implicit-function-declaration] 
> vcpu->arch.eager_fpu = use_eager_fpu() || 
> guest_cpuid_has_mpx(vcpu); ^
> 
> Caused by a bad automatic merge resolution which didn't add the 
> includes of one of its parents.

Thanks; I'll wait for Ingo's 4.1 FPU changes to land, and then note
the semantic conflict in my own pull request.

Also can you please add me and kvm@vger.kernel.org to the list of
addresses that are notified about the KVM tree in linux-next?

Regards,

Paolo
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVaFbHAAoJEL/70l94x66DaAEIAINFmHxlKGpajfWibnDqc4yW
AEuqFlN02JYNTUL+ZPXEpnjYT2eHnZUm+Q3BcwewnsoHcJL+KKKnHkNLlJQCpBc5
iBPPZQvMsbExEF7NsHDioPiZj1BK9IcQQOejRatEystOO9r9Mmw42L09t2M/+lUo
iIoDjpgUp/BegMqC4c3xG682k5v+jH+UIqsBUy7OWvfbTF7Eej98wUXpuuw/rfLU
1JLM9gUo7CEUWYhjH9LfymQ84pFM0iQ7sEm1VUOmxwaRJ2EqF6AueyKB2uqqgGY/
a5uYx88AVMT2wxBpMhsnM9OMkGqZ8uykWAiWhgIhX6JR6Ygk+OgC+d2sKsREQgc=
=PRiY
-----END PGP SIGNATURE-----
