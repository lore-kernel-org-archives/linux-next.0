From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Date: Wed, 5 Sep 2018 06:20:49 -0500
Message-ID: <CAL_JsqK4mLqOa5DsezxwSi=iq6HdMbz7J6xZu9UcKg_QYxvB9Q@mail.gmail.com>
References: <20180905103906.232545a4@canb.auug.org.au> <20180905115411.0c52399c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905115411.0c52399c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 4, 2018 at 8:54 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 5 Sep 2018 10:39:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the devicetree tree, today's linux-next build (x86_64
> > allmodconfig) produced these warnings:
> >
> > WARNING: vmlinux.o(.text+0xf40a16): Section mismatch in reference from the function of_fdt_limit_memory() to the variable .init.data:dt_root_addr_cells
> > The function of_fdt_limit_memory() references
> > the variable __initdata dt_root_addr_cells.
> > This is often because of_fdt_limit_memory lacks a __initdata
> > annotation or the annotation of dt_root_addr_cells is wrong.
> >
> > WARNING: vmlinux.o(.text+0xf40a1d): Section mismatch in reference from the function of_fdt_limit_memory() to the variable .init.data:dt_root_size_cells
> > The function of_fdt_limit_memory() references
> > the variable __initdata dt_root_size_cells.
> > This is often because of_fdt_limit_memory lacks a __initdata
> > annotation or the annotation of dt_root_size_cells is wrong.
> >
> > Introduced by commit
> >
> >   bb35ea5c7c30 ("of/fdt: avoid re-parsing '#{address,size}-cells' in of_fdt_limit_memory")
>
> It turns out that section mismatches are fatal errors in some configs (like powerpc allnoconfig), so I have added the following patch for today:

Sorry about that. I've fixed it now.

Rob
