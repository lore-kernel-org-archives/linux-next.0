From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Date: Thu, 20 Sep 2018 06:49:54 -0700
Message-ID: <CAL_JsqKCu76wKfo9tOKsmD7KB=RvhFCe=1exrCBfrWLJgyaJhw@mail.gmail.com>
References: <20180920114717.2ed5ae6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920114717.2ed5ae6f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Sep 19, 2018 at 6:47 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Rob,
>
> After merging the devicetree tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:

Yes, that's expected. I posted fixes for all of these last week. Some
sub-arch maintainers haven't picked up the patches yet.

Rob
