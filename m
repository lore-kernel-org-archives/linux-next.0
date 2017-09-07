From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2017-09-06-17-01 uploaded
Date: Thu, 7 Sep 2017 10:24:23 +1000
Message-ID: <20170907102423.4bac0d31@canb.auug.org.au>
References: <59b08c79.TDHrzX7XqqIJyQ3V%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59b08c79.TDHrzX7XqqIJyQ3V%akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Wed, 06 Sep 2017 17:02:01 -0700 akpm@linux-foundation.org wrote:
>
> * x509-fix-the-buffer-overflow-in-the-utility-function-for-oid-string.patch

The above patch has a space with its high bit set in the From: line which
"git am" doesn't like.

-- 
Cheers,
Stephen Rothwell
