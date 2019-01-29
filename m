From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the qcom tree
Date: Tue, 29 Jan 2019 13:46:26 +0200
Message-ID: <9e32a49c-fb78-c5f8-77cf-66b4b4a8b4a2@linaro.org>
References: <20190129140846.4dc4c158@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129140846.4dc4c158@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Andy Gross <andy.gross@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Dai <daidavid1@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 1/29/19 05:08, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   arch/arm64/boot/dts/qcom/sdm845.dtsi
> 
> between commits:
> 
>   05556681948b ("arm64: dts: sdm845: Add videocc node")
>   5b6f186f0abb ("arm64: dts: sdm845: Add rpmh powercontroller node")
> 
> from the qcom tree and commit:
> 
>   ae0037dbfc5e ("arm64: dts: sdm845: Add interconnect provider DT nodes")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the fix! I have checked the tree and the merge is correct.

BR,
Georgi
