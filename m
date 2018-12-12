From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: linux-next: manual merge of the phy-next tree with Linus' tree
Date: Wed, 12 Dec 2018 10:37:37 +0530
Message-ID: <c868398c-9410-fa2d-26f4-dd86102a3584@ti.com>
References: <20181212151647.71a5befe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212151647.71a5befe@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Evan Green <evgreen@chromium.org>
List-Id: linux-next.vger.kernel.org

Hi,

On 12/12/18 9:46 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the phy-next tree got a conflict in:
> 
>   Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> 
> between commit:
> 
>   7243ec72b902 ("dt-bindings: phy-qcom-qmp: Fix several mistakes from prior commits")
> 
> from Linus' tree and commit:
> 
>   91fdc9b127c9 ("dt-bindings: phy-qcom-qmp: Fix register underspecification")
> 
> from the phy-next tree.
> 
> I fixed it up (I just used the latter veriosn of the conflicting line)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

I've rebased by 'next' branch on top of my 'fixes' branch to avoid this conflict.

Thanks
Kishon
> 
