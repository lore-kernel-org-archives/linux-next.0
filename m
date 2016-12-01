From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2016-11-30-15-46 uploaded
Date: Thu, 1 Dec 2016 11:44:31 +1100
Message-ID: <20161201114431.2a2cb11d@canb.auug.org.au>
References: <583f6515.fNq/FWln01oGaTxN%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <583f6515.fNq/FWln01oGaTxN%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Wed, 30 Nov 2016 15:47:33 -0800 akpm@linux-foundation.org wrote:
>
> * ima-define-a-canonical-binary_runtime_measurements-list-format.patch

This patch tries to patch the file

  Documentation/kernel-parameters.txt

but that file has been renamed to

  Documentation/admin-guide/kernel-parameters.rst

in linux-next.  I just dropped the hunk from the patch.
-- 
Cheers,
Stephen Rothwell

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
