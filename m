From: shuah <shuah@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the kselftest tree
Date: Mon, 13 May 2019 09:57:45 -0600
Message-ID: <a4ecb5ac-86ec-ac8d-a250-7073351ad23b@kernel.org>
References: <20190514010540.6fbe70e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514010540.6fbe70e0@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, shuah <shuah@kernel.org>
List-Id: linux-next.vger.kernel.org

On 5/13/19 9:05 AM, Stephen Rothwell wrote:
> Hi Shuah,
> 
> In commit
> 
>    e64ee1f5dc1a ("selftests: fix bpf build/test workflow regression when KBUILD_OUTPUT is set")
> 
> Fixes tag
> 
>    Fixes: commit 8ce72dc32578 ("selftests: fix headers_install circular dependency")
> 
> has these problem(s):
> 
>    - leading word 'commit' unexpected
> 

Sorry this is my bad. I will fix it.

thanks,
-- Shuah
