From: Jason Wang <jasowang@redhat.com>
Subject: Re: linux-next: Fixes tag needs some work in the net tree
Date: Thu, 11 Apr 2019 15:24:59 +0800
Message-ID: <722cf76e-a092-5760-8224-c4e62bec3d12@redhat.com>
References: <20190411165859.63be9174@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190411165859.63be9174@canb.auug.org.au>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


On 2019/4/11 下午2:58, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>    813dbeb656d6 ("vhost: reject zero size iova range")
>
> Fixes tag
>
>    Fixes: 6b1e6cc7 ("vhost: new device IOTLB API")
>
> has these problem(s):
>
>    - SHA1 should be at least 12 digits long
>      Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>      or later) just making sure it is not set (or set to "auto").
>

My bad, need I respin or just leave it as is this time?

Thanks
