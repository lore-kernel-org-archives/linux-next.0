From: Ivan Safonov <insafonov@gmail.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Tue, 17 Jul 2018 09:49:45 +0300
Message-ID: <64f9c9c3-edf0-40b8-c3d1-60208025389b@gmail.com>
References: <20180717162839.2f5e7053@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717162839.2f5e7053@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Michael Straube <straube.linux@gmail.com>
List-Id: linux-next.vger.kernel.org

On 07/17/2018 09:28 AM, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/rtl8188eu/core/rtw_security.c: In function 'rtw_tkip_decrypt':
> drivers/staging/rtl8188eu/core/rtw_security.c:399:21: error: storage size of 'mycontext' isn't known
>    struct arc4context mycontext;
>                       ^~~~~~~~~
> drivers/staging/rtl8188eu/core/rtw_security.c:437:4: error: implicit declaration of function 'phase1' [-Werror=implicit-function-declaration]
>      phase1((u16 *)&ttkey[0], prwskey, &prxattrib->ta[0], pnh);
>      ^~~~~~
> drivers/staging/rtl8188eu/core/rtw_security.c:438:4: error: implicit declaration of function 'phase2' [-Werror=implicit-function-declaration]
>      phase2(&rc4key[0], prwskey, (unsigned short *)&ttkey[0], pnl);
>      ^~~~~~
> drivers/staging/rtl8188eu/core/rtw_security.c:442:4: error: implicit declaration of function 'arcfour_init'; did you mean 'rcu_init'? [-Werror=implicit-function-declaration]
>      arcfour_init(&mycontext, rc4key, 16);
>      ^~~~~~~~~~~~
>      rcu_init
> drivers/staging/rtl8188eu/core/rtw_security.c:443:4: error: implicit declaration of function 'arcfour_encrypt'; did you mean 'rtw_wep_encrypt'? [-Werror=implicit-function-declaration]
>      arcfour_encrypt(&mycontext, payload, payload, length);
>      ^~~~~~~~~~~~~~~
>      rtw_wep_encrypt
> drivers/staging/rtl8188eu/core/rtw_security.c:445:23: error: implicit declaration of function 'getcrc32'; did you mean 'get_cred'? [-Werror=implicit-function-declaration]
>      *((__le32 *)crc) = getcrc32(payload, length-4);
>                         ^~~~~~~~
>                         get_cred
> drivers/staging/rtl8188eu/core/rtw_security.c:399:21: warning: unused variable 'mycontext' [-Wunused-variable]
>    struct arc4context mycontext;
>                       ^~~~~~~~~
> 
> Caused by commit
> 
>    0d4876f4e977 ("staging:r8188eu: Use lib80211 to encrypt (TKIP) tx frames")
> 
> interacting with commit
> 
>    69a1d98c831e ("Revert "staging:r8188eu: Use lib80211 to support TKIP"")
> 
> from the staging.current tree.
> 
> I just reverted the staging.current commit ...
> 
All commits using lib8022 in r8188eu cause the system to crash. I will 
revert 5 commits in the near future (2 for decryption and 3 for 
encryption) in one patch, it will be bit easier.

I apologize for such an unpleasant situation.

Ivan Safonov.
