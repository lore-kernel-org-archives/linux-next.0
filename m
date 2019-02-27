From: tanhuazhong <tanhuazhong@huawei.com>
Subject: Re: linux-next: Fixes tag needs some work in the net-next tree
Date: Wed, 27 Feb 2019 09:12:57 +0800
Message-ID: <0788736a-dfba-edd1-f62d-2205d6702f4b@huawei.com>
References: <20190225190034.0cad4e3d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225190034.0cad4e3d@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jian Shen <shenjian15@huawei.com>, Peng Li <lipeng321@huawei.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen & David,

It is my mistake, so sorry about this. There is a redundant "net: hns3: 
" in the fixes tag.

How could I fix it?

Thanks.

On 2019/2/25 16:00, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    a638b1d8cc87 ("net: hns3: fix get VF RSS issue")
> 
> Fixes tag
> 
>    Fixes: 374ad291762a ("net: hns3: net: hns3: Add RSS general configuration support for VF")
> 
> has these problem(s):
> 
>    - Subject does not match target commit subject
>      Just use
> 	git log -1 --format='Fixes: %h (%s)'
> 
