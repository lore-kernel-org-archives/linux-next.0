From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the slave-dma tree
Date: Tue, 27 Nov 2012 11:08:36 +0530
Message-ID: <CAKohpo=K2kX-M4NM9onrn-Rr4otJwcQ1HxN5cKPYvj+Tza_0Ug@mail.gmail.com>
References: <20121127154430.36e87542081a7cc50f80d0f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121127154430.36e87542081a7cc50f80d0f6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: linux-next.vger.kernel.org

On 27 November 2012 10:14, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-spear13xx/spear1310.c between commit b47394911c26 ("ARM:
> SPEAr13xx: Pass DW DMAC platform data from DT") from the slave-dma tree
> and commit 300a6856324a ("ARM: SPEAr1310: Fix AUXDATA for compact flash
> controller") from the arm-soc tree.
>
> I have no idea how to fix this up, so I just effectively dropped the
> arm-doc tree patch.

Hi Stephen,

So sorry for that, Can you please take arm-soc version here? Patch 300a6856324a
is doing the correct thing. i.e. we need

+       OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL, &cf_pdata),

instead of

+       OF_DEV_AUXDATA("arasan,cf-spear1340", MCIF_CF_BASE, NULL, "cf"),

--
viresh
