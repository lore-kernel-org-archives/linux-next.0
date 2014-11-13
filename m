From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2014-11-12-16-34 uploaded (net/wireless/ath9k)
Date: Thu, 13 Nov 2014 09:29:53 -0800
Message-ID: <5464EA91.60409@infradead.org>
References: <5463fd01.PiBwUnCphi1MBsM6%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5463fd01.PiBwUnCphi1MBsM6%akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, ath9k-devel@lists.ath9k.org
List-Id: linux-next.vger.kernel.org

On 11/12/14 16:36, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2014-11-12-16-34 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 

on x86_64: (from linux-next.patch, not mmotm patches)


  CC [M]  drivers/net/wireless/ath/ath9k/common-spectral.o
../drivers/net/wireless/ath/ath9k/common-spectral.c:40:5: error: redefinition of 'ath_cmn_process_fft'
 int ath_cmn_process_fft(struct ath_spec_scan_priv *spec_priv, struct ieee80211_hdr *hdr,
     ^
In file included from ../drivers/net/wireless/ath/ath9k/common.h:27:0,
                 from ../drivers/net/wireless/ath/ath9k/ath9k.h:27,
                 from ../drivers/net/wireless/ath/ath9k/common-spectral.c:18:
../drivers/net/wireless/ath/ath9k/common-spectral.h:146:19: note: previous definition of 'ath_cmn_process_fft' was here
 static inline int ath_cmn_process_fft(struct ath_spec_scan_priv *spec_priv,
                   ^
make[6]: *** [drivers/net/wireless/ath/ath9k/common-spectral.o] Error 1



-- 
~Randy
