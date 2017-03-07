From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: mmotm 2017-03-06-16-52 uploaded
Date: Tue, 7 Mar 2017 13:07:55 +1100
Message-ID: <20170307130755.29ccd1b1@canb.auug.org.au>
References: <58be0472.psWRZiN5XRSmRqWR%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <58be0472.psWRZiN5XRSmRqWR%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, mhocko@suse.cz, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

Hi Andrew,

On Mon, 06 Mar 2017 16:53:06 -0800 akpm@linux-foundation.org wrote:
>
>   linux-next-rejects.patch

Just wondering why this includes "struct iomap" -> "const struct iomap"
conversions when they should just be done in a regular patch.

-- 
Cheers,
Stephen Rothwell

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
