From: Ursula Braun <ubraun@linux.ibm.com>
Subject: Re: linux-next: Fixes tag needs some work in the net tree
Date: Fri, 12 Apr 2019 09:19:55 +0200
Message-ID: <4f7308ce-05ff-1518-8874-2afdef2b679b@linux.ibm.com>
References: <20190412071257.6938724c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412071257.6938724c@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Karsten Graul <kgraul@linux.ibm.com>
List-Id: linux-next.vger.kernel.org



On 4/11/19 11:12 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   8ef659f1a840 ("net/smc: fix return code from FLUSH command")
> 
> Fixes tag
> 
>   Fixes: a9d8b0b1e3d6 ("net/smc: add pnet table namespace support")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Did you mean
> 
> Fixes: 64e28b52c7a6 ("net/smc: add pnet table namespace support")
> 

Sorry, my fault. And yes, we meant
Fixes: 64e28b52c7a6 ("net/smc: add pnet table namespace support")
