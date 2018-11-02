From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86/build: Build VSMP support only if CONFIG_PCI is
 selected
Date: Fri, 2 Nov 2018 08:13:07 +0100
Message-ID: <2073effd-4f02-c784-ca71-69ba49f51b88@suse.com>
References: <2130cd90-2c8f-2fc4-0ac8-81a5aea153b2@scalemp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2130cd90-2c8f-2fc4-0ac8-81a5aea153b2@scalemp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eial Czerwacki <eial@scalemp.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Randy Dunlap <rdunlap@infradead.org>, "Shai Fultheim (Shai@ScaleMP.com)" <Shai@ScaleMP.com>, Andrew Morton <akpm@linux-foundation.org>, "broonie@kernel.org" <broonie@kernel.org>, "mhocko@suse.cz" <mhocko@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "mm-commits@vger.kernel.org" <mm-commits@vger.kernel.org>, X86 ML <x86@kernel.org>, Oren Twaig <oren@scalemp.com>
List-Id: linux-next.vger.kernel.org

On 01/11/2018 19:27, Eial Czerwacki wrote:
> vsmp dependency on pv_irq_ops removed some years ago, so now let's clean
> it up from vsmp_64.c.
> 
> In short, "cap & ctl & (1 << 4)" was always returning 0, as such we can
> remove all the PARAVIRT/PARAVIRT_XXL code handling that.
> 
> However, the rest of the code depends on CONFIG_PCI, so fix it accordingly.
> in addition, rename set_vsmp_pv_ops to set_vsmp_ctl.
> 
> Signed-off-by: Eial Czerwacki <eial@scalemp.com>
> Acked-by: Shai Fultheim <shai@scalemp.com>

While I'm still thinking selection of HYPERVISOR_GUEST and PARAVIRT
is a little bit strange, you can add:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
